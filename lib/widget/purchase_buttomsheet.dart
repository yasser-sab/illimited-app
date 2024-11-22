import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/app_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/purchase_service.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/purchase_status.dart';
import 'package:illimited_app/widget/status_tag.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomSheetContainer extends StatefulWidget {
  @override
  _BottomSheetContainerState createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final PurchaseService _purchaseService = PurchaseService();
  bool hasPurchased = false;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    // Set up the AnimationController with a custom duration to control speed
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10), // Adjust to control animation speed
    )..repeat();
    _checkPurchaseStatus();
    _initializePurchaseService();
    _purchaseService.listenToPurchaseUpdates(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializePurchaseService() async {
    await _purchaseService.initialize();
    setState(() {
      log("disabling loading");
      _isLoading = false;
    });
  }

  Future<void> _checkPurchaseStatus() async {
    hasPurchased = await _purchaseService.hasUserPurchased();
    log(hasPurchased.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Pass the controller to BottomSheetContent widget
    return Container(
      height: getScreenHeight(context),
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : BottomSheetContent(
              controller: _controller,
              hasPurchased: hasPurchased,
              purchaseService: _purchaseService,
            ),
    );
  }
}

// BottomSheetContent widget with the Lottie animation and any other UI elements
class BottomSheetContent extends StatelessWidget {
  final AnimationController controller;
  final bool hasPurchased;
  final PurchaseService purchaseService;
  const BottomSheetContent(
      {required this.controller,
      required this.hasPurchased,
      required this.purchaseService});

  @override
  Widget build(BuildContext context) {
    if (purchaseService.productDetails == null) {
      context.pop();
    }
    return Stack(
      children: [
        // Lottie Background Animation
        Positioned.fill(
          child: Lottie.asset(
            'assets/lottie/gradient-background.json',
            fit: BoxFit.cover,
            controller: controller,
            // frameRate: FrameRate(120),
            onLoaded: (composition) {
              // Adjust the speed by setting the controller duration based on the animation’s length
              controller.duration =
                  composition.duration * 2; // Example: Slow it down by 2x
            },
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),

        // Content overlay on top of Lottie animation
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: Colors.black.withOpacity(0.3),
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  Visibility(
                    visible: false,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Restore",
                          style: getFontStyle(context).copyWith(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              AppLocalizations.of(context)!.upgradeTo,
              style:
                  GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 25,
                  child: Image.asset(
                    "assets/icon/oultine-diamond.png",
                    color: hasPurchased ? primaryColor : secondaryLightOrange,
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                InkWell(
                  onTap: () {
                    // PurchaseService().removeEntitlement();
                    // context.read<AppProvider>().setProccessingPurchase(true);
                    // showDialog(
                    //   barrierDismissible: false,
                    //   context: context,
                    //   builder: (context) {
                    //     return StatusPopup(
                    //       image:
                    //           context.watch<AppProvider>().isProccessingPurchase
                    //               ? Padding(
                    //                   padding: const EdgeInsets.all(8.0),
                    //                   child: SizedBox(
                    //                       width: 60,
                    //                       height: 60,
                    //                       child: CircularProgressIndicator(
                    //                         color: const Color.fromARGB(
                    //                             255, 26, 133, 30),
                    //                         strokeWidth: 3,
                    //                       )),
                    //                 )
                    //               : Lottie.asset("assets/lottie/purchased.json",
                    //                   width: 150),
                    //       message: context
                    //               .watch<AppProvider>()
                    //               .isProccessingPurchase
                    //           ? "Your purchase is being processed"
                    //           : "Success! Your purchase is complete. Enjoy your program",
                    //     );
                    //   },
                    // );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.premium,
                    style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5),
                  ),
                ),
                SizedBox(
                  width: 6,
                ),
                SizedBox(
                  width: 25,
                  child: Image.asset(
                    "assets/icon/oultine-diamond.png",
                    color: hasPurchased ? primaryColor : secondaryLightOrange,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                    child: Image.asset(
                      "assets/icon/check-mark.png",
                      color: hasPurchased ? primaryColor : secondaryLightOrange,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Text(
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    AppLocalizations.of(context)!.entire8WeekProgram,
                    style: GoogleFonts.roboto(
                        fontSize: 17, fontWeight: FontWeight.w400),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                    child: Image.asset(
                      "assets/icon/check-mark.png",
                      color: hasPurchased ? primaryColor : secondaryLightOrange,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Text(
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    AppLocalizations.of(context)!.fullAccessToChallengesAndTips,
                    style: GoogleFonts.roboto(
                        fontSize: 17, fontWeight: FontWeight.w400),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                    child: Image.asset(
                      "assets/icon/check-mark.png",
                      color: hasPurchased ? primaryColor : secondaryLightOrange,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Text(
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    AppLocalizations.of(context)!.fullAccessToContent,
                    style: GoogleFonts.roboto(
                        fontSize: 17, fontWeight: FontWeight.w400),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                    child: Image.asset(
                      "assets/icon/check-mark.png",
                      color: hasPurchased ? primaryColor : secondaryLightOrange,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Text(
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    AppLocalizations.of(context)!.exclusiveContentAccess,
                    style: GoogleFonts.roboto(
                        fontSize: 17, fontWeight: FontWeight.w400),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Flexible(
              child: Text(
                AppLocalizations.of(context)!.eightWeekProgram,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: getFontStyle(context).copyWith(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Visibility(
              visible: hasPurchased,
              child: StatusTag(status: Status.completed, tagFontColor: Colors.white, tagText: AppLocalizations.of(context)!.upgraded,),
            ),
            Visibility(
              visible: !hasPurchased,
              child: TextButton(
                onPressed: () {
                  purchaseService.buyProduct(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      Colors.orange, // Set the button's color to green
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        25), // Adjust the radius as needed
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: AppLocalizations.of(context)!.unlockAt,
                      style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight:
                              FontWeight.w500), // Set text color for contrast
                      children: [
                        TextSpan(
                          text: purchaseService.productDetails!.first.price,
                          style: GoogleFonts.roboto(
                              fontSize: 17,
                              fontWeight: FontWeight
                                  .w800 // Ensure consistent text color
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Visibility(
              visible: !hasPurchased,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(RouteNames.termsConditions);
                },
                child: Text(
                  AppLocalizations.of(context)!.terms_title,
                  style: getFontStyle(context).copyWith(
                      fontSize: 13,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
