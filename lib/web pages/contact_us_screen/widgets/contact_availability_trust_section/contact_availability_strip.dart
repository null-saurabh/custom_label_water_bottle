import 'package:flutter/material.dart';

import '../../../../core/theme/design_token.dart';

class ContactAvailabilityStrip extends StatelessWidget {
  const ContactAvailabilityStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF3F9FF),
            Color(0xFFEAF3FF),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: const [
          _AvailabilityText(),
          SizedBox(height: 12),
          Divider(
            color: DT.border,
            thickness: 1,
            height: 24,
          ),
          SizedBox(height: 12),
          _TrustItemsRow(),
        ],
      ),
    );
  }
}

class _AvailabilityText extends StatelessWidget {
  const _AvailabilityText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        style: TextStyle(
          fontSize: 15,
          color: DT.body,
        ),
        children: [
          TextSpan(
            text: "Reach out Today. ",
            style: Theme.of(context).textTheme.displaySmall,
            // style: TextStyle(
            //   fontSize: 16,
            //   fontWeight: FontWeight.w600,
            //   color: DT.heading,
            // ),
          ),
          TextSpan(
            style: TextStyle(
              fontSize: 14,
            ),
            text: "We’re available Monday–Friday, 9 AM – 6 PM (IST)",
          ),
        ],
      ),
    );
  }
}


class _TrustItemsRow extends StatelessWidget {
  const _TrustItemsRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 40,
      runSpacing: 16,
      children: const [
        _TrustItem(
          icon: Icons.inventory_2_outlined,
          label: "Bulk Supply Specialists",
        ),
        _TrustItem(
          icon: Icons.handshake_outlined,
          label: "Trusted by Hotels & Brands",
        ),
        _TrustItem(
          icon: Icons.verified_outlined,
          label: "Quality Certified",
        ),
      ],
    );
  }
}


class _TrustItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TrustItem({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 18,
          color: DT.heading,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: DT.heading,
          ),
        ),
      ],
    );
  }
}

