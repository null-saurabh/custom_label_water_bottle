import 'package:flutter/material.dart';

class TrustStrip extends StatelessWidget {
  const TrustStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 40,
      runSpacing: 20,
      children: const [
        _TrustItem("Quality Certified"),
        _TrustItem("Food-Grade Packaging"),
        _TrustItem("Bulk Supply Ready"),
        _TrustItem("Hospitality Trusted"),
      ],
    );
  }
}

class _TrustItem extends StatelessWidget {
  final String text;
  const _TrustItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.verified, color: Color(0xFF3B82F6)),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3A4A66),
          ),
        ),
      ],
    );
  }
}
