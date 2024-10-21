import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/app_provider.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart'; // Import your AppProvider
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class EmailVerificationDialog extends StatelessWidget {
  final String message;
  final String subtitle;
  final VoidCallback verifyButtonCallBack;

  const EmailVerificationDialog({
    required this.message,
    required this.subtitle,
    required this.verifyButtonCallBack,
  });

  @override
  Widget build(BuildContext context) {
    int cooldown = context.watch<AppProvider>().sendVerificationCooldown;
    bool isButtonEnabled = cooldown == 0;

    Widget okButton = PrimaryButton(
      text: AppLocalizations.of(context)!.ok,
      onPressed: () {
        Navigator.of(context).pop();
      },
      width: MediaQuery.of(context).size.width * 0.30,
    );

    return AlertDialog(
      actionsOverflowButtonSpacing: 20,
      icon: Lottie.asset(
        "assets/lottie/pendingEmail.json",
        height: 100,
      ),
      backgroundColor: Color.fromARGB(255, 213, 236, 255),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: getFontStyle(context).copyWith(
                  fontSize: 17.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: getFontStyle(context).copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          InkWell(
            onTap: isButtonEnabled
                ? () {
                    verifyButtonCallBack();
                    context.read<AppProvider>().startCooldown(emailMessageCoolDown); // Start cooldown
                  }
                : null,
            child: Text(
              isButtonEnabled
                  ? AppLocalizations.of(context)!.resend
                  : "Re-send $cooldown secs",
              style: getFontStyle(context).copyWith(
                    color: isButtonEnabled ? Colors.blue : Colors.grey,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      actions: [okButton],
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
