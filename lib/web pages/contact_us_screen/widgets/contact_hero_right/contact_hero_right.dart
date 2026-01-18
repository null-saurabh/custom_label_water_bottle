import 'package:cwbl_website/web%20pages/contact_us_screen/widgets/contact_hero_right/widgets/contact_illustration.dart';
import 'package:cwbl_website/web%20pages/contact_us_screen/widgets/contact_hero_right/widgets/contact_reach_out_header.dart';
import 'package:flutter/material.dart';

import '../../../../core/responsive.dart';
import 'widgets/contact_details.dart';

class ContactRight extends StatelessWidget {
  const ContactRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context)?16.0:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Responsive.isMobile(context)?SizedBox():ContactIllustration(),
          Responsive.isMobile(context)?SizedBox(height: 8,):SizedBox(height: 20),
          ReachOutHeader(),
          SizedBox(height: 20),
          ContactDetails(),
          SizedBox(height: 12),


        ],
      ),
    );
  }
}
