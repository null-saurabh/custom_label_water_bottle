import 'package:flutter/material.dart';

import '../../../../../core/theme/design_token.dart';
import '../../../../../widgets/premium_button.dart';

class ContactFormCard extends StatelessWidget {
  const ContactFormCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // important
      child: Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 30,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          children: [
            const _ContactInput(hint: "Your Name*", icon: Icons.person),
            const SizedBox(height: 16),
            const _ContactInput(hint: "Your Email*", icon: Icons.email),
            const SizedBox(height: 16),
            const _ContactInput(hint: "Mobile Number*", icon: Icons.phone),
            const SizedBox(height: 16),
            const _ContactInput(
              hint: "Your Message*",
              icon: Icons.message,
              maxLines: 3,
            ),
            const SizedBox(height: 24),

            PremiumButton(text: "Send Message", onTap: () {}),
            const SizedBox(height: 12),

            const Text(
                "We’ll respond within 24 business hours",
                style: TextStyle(fontSize: 13, color: Colors.grey,)
            ),
          ],
        ),
      ),
    );
  }
}



class _ContactInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final int maxLines;

  const _ContactInput({
    required this.hint,
    required this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: Icon(icon, color: Colors.grey),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: DT.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: DT.border),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
      ),
    );
  }
}
