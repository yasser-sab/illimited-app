import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:illimited_app/providers/app_provider.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/widget/purchase_status.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

enum PurchaseState { idle, pending, success, error, canceled }

class PurchaseService {
  List<ProductDetails>? productDetails;
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  bool available = false;
  Stream<List<PurchaseDetails>>? _purchaseStream;
  static const String productId = 'exclusive_content';

  // List<ProductDetails> mockProducts = [
  //   ProductDetails(
  //     id: 'unlock_exclusive_content',
  //     title: 'Exclusive Content',
  //     description: 'Unlock all exclusive content with a one-time purchase.',
  //     rawPrice: 19.99,
  //     price: '19.99',
  //     currencyCode: "CAD"
  //   ),
  // ];

  void initialize() {
    log("a");
    _purchaseStream = _inAppPurchase.purchaseStream;
    _inAppPurchase.isAvailable().then((bool isAvailable) {
      log("available = $isAvailable");
      available = isAvailable;
      if (isAvailable) {
        _getProducts();
      }
    });
  }

  Future<void> _getProducts() async {
    log("IN get PRODUCTS");
    final Set<String> ids = {productId};
    final ProductDetailsResponse response =
        await _inAppPurchase.queryProductDetails(ids);
        log(response.notFoundIDs.length.toString());
    if (response.notFoundIDs.isEmpty) {
      productDetails = response.productDetails;
    }
    // print("Mock Products: ${mockProducts[0].title} - ${mockProducts[0].price}");
  }

  Future<bool> buyProduct(BuildContext context) async {
    if (productDetails != null) {
      context.read<AppProvider>().setInfo("Poduct EXIST");
      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: productDetails!.first);
      _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam).then(
        (isPurchased) {
          if (isPurchased) {
            log("PURCHSED");
            return true;
          } else {
            log("NOT PURCHSED");
            return false;
          }
        },
      );
      log("NOT PURCHSED 2");
      return false;
    } else {
      context.read<AppProvider>().setInfo("Poduct is not exist");
      log("Poduct is not exist");
      return false;
    }
  }

  void listenToPurchaseUpdates() {
    _purchaseStream?.listen((purchaseDetailsList) {
      _handlePurchaseUpdates(purchaseDetailsList);
    }, onDone: () {
      _purchaseStream = null;
    });
  }

  //   void listen() {
  //   final Stream purchaseUpdated =
  //       InAppPurchase.instance.purchaseStream;
  //   _subscription = purchaseUpdated.listen((purchaseDetailsList) {
  //     _listenToPurchaseUpdated(purchaseDetailsList);
  //   }, onDone: () {
  //     _subscription.cancel();
  //   }, onError: (error) {
  //     // handle error here.
  //   });
  //   super.initState();
  // }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) {
    for (var purchaseDetails in purchaseDetailsList) {
      switch (purchaseDetails.status) {
        case PurchaseStatus.pending:
          StatusPopup(
            message: "Processing your purchase. Please wait...",
            image: Image.asset("assets/images/mood0.png"),
          );
          break;

        case PurchaseStatus.purchased:
          // The purchase was successful, verify and consume the purchase
          _verifyAndConsumePurchase(purchaseDetails);
          break;

        case PurchaseStatus.error:
          StatusPopup(
            message: purchaseDetails.error?.message ??
                "An error occurred. Please try again.",
            image: Image.asset("assets/images/mood0.png"),
          );
          break;

        case PurchaseStatus.canceled:
          // Optionally handle when the user cancels the purchase
          StatusPopup(
            message: "The Operation had been cancelled",
            image: Image.asset("assets/images/mood0.png"),
          );
          break;

        default:
          break;
      }
    }
  }

  Future<void> _verifyAndConsumePurchase(
      PurchaseDetails purchaseDetails) async {
    await _savePurchaseToFirestore(purchaseDetails).then(
      (isPurchaseSaved) async {
        if (isPurchaseSaved) {
          if (purchaseDetails.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchaseDetails);
          }
        } else {}
      },
    );
  }

  Future<bool> _savePurchaseToFirestore(PurchaseDetails purchaseDetails) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'hasPurchased': true,
        }, SetOptions(merge: true));
        return true;
      } catch (e) {
        log("hasPurched field in Firebase is not set, operation cancelled.");
        return false;
      }
    } else {
      AuthService().signOut();
      return false;
    }
  }

  Future<bool> hasUserPurchased() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    return doc.exists && doc.data()?['hasPurchased'] == true;
  }
}
