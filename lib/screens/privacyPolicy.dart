import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';

class PrivacyPolicy extends StatelessWidget {
  final double titleSize = 19;
  final double contentSize = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.privacyPolicy,
          style:
              GoogleFonts.roboto().copyWith(fontSize: 27, letterSpacing: 1.5),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Effective Date
            Text(
              AppLocalizations.of(context)!.effective_date_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.effective_date_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Introduction Section
            Text(
              AppLocalizations.of(context)!.introduction_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.introduction_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Information Collection Section
            Text(
              AppLocalizations.of(context)!.information_collection_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.information_collection_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Data Usage Section
            Text(
              AppLocalizations.of(context)!.data_usage_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.data_usage_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Data Sharing Section
            Text(
              AppLocalizations.of(context)!.data_sharing_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.data_sharing_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Data Security Section
            Text(
              AppLocalizations.of(context)!.data_security_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.data_security_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Usage and Access Section
            Text(
              AppLocalizations.of(context)!.usage_access_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.usage_access_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Personal Data Protection Section
            Text(
              AppLocalizations.of(context)!.personal_data_protection_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.personal_data_protection_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // User Rights Section
            Text(
              AppLocalizations.of(context)!.user_rights_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.user_rights_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Cookies Section
            Text(
              AppLocalizations.of(context)!.cookies_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.cookies_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Privacy Policy Modifications Section
            Text(
              AppLocalizations.of(context)!.modifications_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.modifications_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Contact Section
            Text(
              AppLocalizations.of(context)!.contact_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.contact_text,
              style: TextStyle(
                fontSize: contentSize,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
