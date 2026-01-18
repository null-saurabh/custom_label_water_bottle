import 'package:cwbl_website/web%20pages/contact_us_screen/widgets/contact_availability_trust_section/contact_availability_strip.dart';
import 'package:cwbl_website/web%20pages/contact_us_screen/widgets/contact_hero_left/contact_hero_left.dart';
import 'package:cwbl_website/web%20pages/contact_us_screen/widgets/contact_hero_right/contact_hero_right.dart';
import 'package:flutter/material.dart';
import '../../core/responsive.dart';
import '../../core/theme/gradients.dart';
import '../../widgets/site_header.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFF6FAFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SiteHeader(),

            Container(
              padding:  EdgeInsets.only(top: Responsive.isMobile(context) ? 20.0: 60,bottom: 30),

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF3F9FF),
                    Color(0xFFEAF3FF),
                  ],
                ),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: _buildHero(context),
                ),
              ),
            ),

            SizedBox(height: Responsive.isMobile(context)?0:32),

            ContactAvailabilityStrip(),

            SiteHeader(bgColor: Colors.white,),

            Container(
              decoration: BoxDecoration(
                gradient: Responsive.isMobile(context)
                    ? AppGradients.footerBottom
                    : null
              ),
              child: Column(
                children: [
                  SizedBox(height: 20),

                  Row(
                    children: [
                      SizedBox(width: Responsive.isMobile(context)?16:48,),
                      Icon(Icons.copyright_outlined,color: Colors.grey,size: 20,),
                      SizedBox(width: 4,),
                      Text("2024 Custom Label Water Bottles. All rights reserved.",style: TextStyle(color: Colors.grey,fontSize: 12),),
                    ],
                  ),
                  SizedBox(height: 40),

                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}


Widget _buildHero(BuildContext context) {
  if (Responsive.isMobile(context)) {
    return Column(
      children: const [
        // ContactHeroImageMobile(), // bottle image first
        // SizedBox(height: 24),
        ContactLeft(),             // text + form
        SizedBox(height: 24),
        ContactRight()
      ],
    );
  }

  // Tablet & Desktop
  return const Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(flex: 4, child: ContactLeft()),
      SizedBox(width: 60),
      Expanded(flex: 4, child: ContactRight()),
    ],
  );
}

