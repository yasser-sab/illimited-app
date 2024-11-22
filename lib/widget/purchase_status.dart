import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/providers/app_provider.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class StatusPopup extends StatelessWidget {
  final String message;
  final Widget image;
  final VoidCallback onPressed;
  const StatusPopup({
    Key? key,
    required this.message,
    required this.image, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the image at the top
            image,
            const SizedBox(height: 16.0),
            // Display the message below the image
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                color: Colors.black
              ),
            ),
            const SizedBox(height: 24.0),
            // Button to close the popup
            Visibility(
              visible: !context.watch<AppProvider>().isProccessingPurchase,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PrimaryButton(
                  borderRadius: 5,
                  height: 50,
                  onPressed: onPressed,
                  text: AppLocalizations.of(context)!.ok,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
