import 'package:flutter/material.dart';

import '../../../../../core/responsive.dart';

class ContactIllustration extends StatelessWidget {
  const ContactIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/contact_illustration.png',
      fit: BoxFit.contain,
      height: Responsive.isMobile(context)? 200 :null,
    );
  }
}
