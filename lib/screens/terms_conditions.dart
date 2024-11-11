import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';

class TermsConditions extends StatelessWidget {
  double titleSize = 19;
  double contentSize = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          toolbarHeight: 80,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.terms_title,
            style: GoogleFonts.roboto()
                .copyWith(fontSize: 27, letterSpacing: 1.5),
          ),
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.introduction_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),

            // Service Description Section
            Text(
              AppLocalizations.of(context)!.service_description_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.service_description_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),

            // Subscription and Payment Section
            Text(
              AppLocalizations.of(context)!.subscription_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.fees_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.refund_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),

            // Use and Access Section
            Text(
              AppLocalizations.of(context)!.use_access_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.use_access_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),

            // Intellectual Property Section
            Text(
              AppLocalizations.of(context)!.intellectual_property_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.intellectual_property_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),

            // Liability Section
            Text(
              AppLocalizations.of(context)!.liability_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.liability_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),

            // Data Protection Section
            Text(
              AppLocalizations.of(context)!.data_protection_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.data_protection_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),

            // Modifications Section
            Text(
              AppLocalizations.of(context)!.modifications_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.modifications_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),

            // Dispute Resolution Section
            Text(
              AppLocalizations.of(context)!.dispute_resolution_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.dispute_resolution_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
            SizedBox(height: 16),

            // Contact and Support Section
            Text(
              AppLocalizations.of(context)!.contact_support_title,
              style: TextStyle(
                fontSize: titleSize,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
             padding: const EdgeInsets.only(left: 10),
              child: Text(
                AppLocalizations.of(context)!.contact_support_text,
                style: TextStyle(fontSize: contentSize, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
