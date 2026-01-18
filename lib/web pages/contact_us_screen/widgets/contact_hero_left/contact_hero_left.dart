import 'package:cwbl_website/web%20pages/contact_us_screen/widgets/contact_hero_left/widgets/contact_form_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/design_token.dart';

class ContactLeft extends StatelessWidget {
  const ContactLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Let’s Chat.",
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.w700,
            color: DT.heading,
          ),
        ),
        SizedBox(height: 12),
        Text(
          "We're here to help with\nyour custom water bottle needs",
          style: TextStyle(
            fontSize: 18,
            color: DT.body,
            height: 1.6,
          ),
        ),
        SizedBox(height: 24),

        _CheckPoint("Get a quote or sample bottles"),
        _CheckPoint("Discuss your requirements"),
        _CheckPoint("Call or drop us a message anytime"),

        SizedBox(height: 36),
        ContactFormCard(),
      ],
    );
  }
}



class _CheckPoint extends StatelessWidget {
  final String text;
  const _CheckPoint(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(Icons.check, color: Colors.blue, size: 20),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 16, color: DT.body)),
        ],
      ),
    );
  }
}



