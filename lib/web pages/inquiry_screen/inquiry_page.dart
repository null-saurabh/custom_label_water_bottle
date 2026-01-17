import 'package:cwbl_website/web%20pages/home_screen/widgets/hero_section.dart' show HeroSection;
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/bottom_trust_strip.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/widgets/form_section_inquiry.dart' show EnquiryFormSection;
import 'package:flutter/material.dart';

class BulkEnquiryPage extends StatelessWidget {
  const BulkEnquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            const SizedBox(height: 40),
            EnquiryFormSection(),
            const SizedBox(height: 60),
            TrustStrip(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
