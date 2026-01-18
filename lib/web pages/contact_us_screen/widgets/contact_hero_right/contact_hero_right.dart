import 'package:cwbl_website/web%20pages/contact_us_screen/widgets/contact_hero_right/widgets/contact_illustration.dart';
import 'package:cwbl_website/web%20pages/contact_us_screen/widgets/contact_hero_right/widgets/contact_reach_out_header.dart';
import 'package:flutter/material.dart';

import 'widgets/contact_details.dart';

class ContactRight extends StatelessWidget {
  const ContactRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ContactIllustration(),
        SizedBox(height: 20),
        ReachOutHeader(),
        SizedBox(height: 20),
        ContactDetails(),
        SizedBox(height: 12),


      ],
    );
  }
}
