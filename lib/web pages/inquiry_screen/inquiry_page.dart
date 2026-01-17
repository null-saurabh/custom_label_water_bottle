import 'package:cwbl_website/web%20pages/home_screen/widgets/hero_section.dart' show HeroSectionHomePage;
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/bottom_trust_strip.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry.dart' show EnquiryFormSection;
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/hero_section_inquiry.dart';
import 'package:flutter/material.dart';

import '../home_screen/widgets/site_header.dart';

class BulkEnquiryPage extends StatelessWidget {
  const BulkEnquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SiteHeader(),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 40),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFF3F9FF),
                      Color(0xFFEAF3FF),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    HeroSectionInquiry(),
                    const SizedBox(height: 40),
                    EnquiryFormSection(),
                    // const SizedBox(height: 60),
                    // TrustStrip(),
                    // const SizedBox(height: 80),
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
