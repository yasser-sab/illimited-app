import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/providers/app_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/widget/purchase_status.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  Future<void> initialize() async {
    log("a");
    _purchaseStream = _inAppPurchase.purchaseStream;
    bool isAvailablee = await _inAppPurchase.isAvailable();
    available = isAvailablee;
    if (isAvailablee) {
      await _getProducts();
    }
    // _inAppPurchase.isAvailable().then((bool isAvailable) async {
    //   available = isAvailable;
    //   if (isAvailable) {
    //     await _getProducts();
    //   }
    // });
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
    log("END getProducts");
  }

  Future<bool> buyProduct(BuildContext context) async {
    if (productDetails != null) {
      // context.read<AppProvider>().setInfo("Poduct EXIST");
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
      // context.read<AppProvider>().setInfo("Poduct is not exist");
      log("Poduct is not exist");
      return false;
    }
  }

  void listenToPurchaseUpdates(BuildContext context) {
    _purchaseStream?.listen((purchaseDetailsList) {
      _handlePurchaseUpdates(purchaseDetailsList, context);
    }, onDone: () {
      log("DONE");
      _purchaseStream = null;
    }, onError: (f) {
      log("EROOR");
    });
  }

  void _handlePurchaseUpdates(
      List<PurchaseDetails> purchaseDetailsList, BuildContext context) {
    log("IN _handlePurchaseUpdates");

    for (var purchaseDetails in purchaseDetailsList) {
      switch (purchaseDetails.status) {
        case PurchaseStatus.pending:
          log("Processing your purchase. Please wait...");
          // StatusPopup(
          //   message: "Processing your purchase. Please wait...",
          //   image: Image.asset("assets/images/mood0.png"),
          // );
          break;

        case PurchaseStatus.purchased:
          context.read<AppProvider>().setProccessingPurchase(true);
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return StatusPopup(
                onPressed: () {
                  context.pushReplacement(RouteNames.dashboard);
                },
                image: context.watch<AppProvider>().isProccessingPurchase
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 26, 133, 30),
                              strokeWidth: 3,
                            )),
                      )
                    : Lottie.asset("assets/lottie/purchased.json", width: 150),
                message: context.watch<AppProvider>().isProccessingPurchase
                    ? AppLocalizations.of(context)!.purchaseProcessing
                    : AppLocalizations.of(context)!.purchaseSuccess,
              );
            },
          );
          _verifyAndConsumePurchase(purchaseDetails, context);
          break;

        case PurchaseStatus.error:
          log("An error occurred. Please try again.");
          showDialog(
            context: context,
            builder: (context) {
              return StatusPopup(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                message:
                    AppLocalizations.of(context)!.purchaseFailed,
                image: Image.asset(
                  "assets/icon/card-declined.png",
                  width: 100,
                ),
              );
            },
          );

          break;

        case PurchaseStatus.canceled:
          log("The Operation had been cancelled");
          showDialog(
            context: context,
            builder: (context) {
              return StatusPopup(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                message:
                    AppLocalizations.of(context)!.purchaseFailed,
                image: Image.asset(
                  "assets/icon/card-declined.png",
                  width: 100,
                ),
              );
            },
          );
          break;

        default:
          break;
      }
    }
  }

  Future<void> _verifyAndConsumePurchase(
      PurchaseDetails purchaseDetails, BuildContext context) async {
    log("IN _verifyAndConsumePurchase");

    await _savePurchaseToFirestore(purchaseDetails).then(
      (isPurchaseSaved) async {
        if (isPurchaseSaved) {
          log("Purchase Saved in FireStore");
          if (purchaseDetails.pendingCompletePurchase) {
            await _inAppPurchase.completePurchase(purchaseDetails);
            context.read<AppProvider>().setProccessingPurchase(false);
          }
        } else {
          log("Purchase Saved in NOT FireStore");
          context.pop(context);
        }
      },
    ).onError(
      (error, stackTrace) {
        context.pop(context);
      },
    );
  }

  Future<bool> _savePurchaseToFirestore(PurchaseDetails purchaseDetails) async {
    log("IN _savePurchaseToFirestore");
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
    log("IN hasUserPurchased");

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    return doc.exists && doc.data()?['hasPurchased'] == true;
  }
}
