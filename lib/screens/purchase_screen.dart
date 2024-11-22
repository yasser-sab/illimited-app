import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:illimited_app/providers/app_provider.dart';
import 'package:illimited_app/services/purchase_service.dart';
import 'package:provider/provider.dart';

class PurchaseScreen extends StatefulWidget {
  @override
  _PurchaseScreenState createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  final PurchaseService _purchaseService = PurchaseService();
  bool hasPurchased = false;

  @override
  void initState() {
    log("initState");

    super.initState();
    // _checkPurchaseStatus();
    log("initialize");

    _purchaseService.initialize();
    _purchaseService.listenToPurchaseUpdates();
  }

  Future<void> _checkPurchaseStatus() async {
    hasPurchased = await _purchaseService.hasUserPurchased();
    setState(() {});
  }

  void _buyProduct() {
    _purchaseService.buyProduct(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exclusive Content")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _buyProduct,
              child: Text("Unlock for \$19.99 CAD"),
            ),
            Text(context.watch<AppProvider>().info, style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
