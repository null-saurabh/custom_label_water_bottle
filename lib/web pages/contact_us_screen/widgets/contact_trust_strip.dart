import 'package:flutter/material.dart';

import '../../../core/theme/design_token.dart';

class ContactTrustStrip extends StatelessWidget {
  const ContactTrustStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            _InfoCard(Icons.phone, "Call Us", "+91 98765 43210"),
            _InfoCard(Icons.email, "Email Us", "support@yourwater.com"),
            _InfoCard(Icons.location_on, "Visit Us",
                "Bengaluru, India"),
          ],
        ),
      ),
    );
  }
}


class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoCard(this.icon, this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: DT.heading),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(color: DT.body)),
        ],
      ),
    );
  }
}

