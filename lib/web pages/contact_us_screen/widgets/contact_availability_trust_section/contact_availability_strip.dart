import 'package:flutter/material.dart';

import '../../../../core/responsive.dart';
import '../../../../core/theme/design_token.dart';
import '../../../../core/theme/gradients.dart';

class ContactAvailabilityStrip extends StatelessWidget {
  const ContactAvailabilityStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Responsive.isMobile(context) ? 16 : 32,
      ),
      decoration: BoxDecoration(
        gradient: Responsive.isMobile(context)
            ? AppGradients.trustStrip
            : LinearGradient(colors: [Color(0xFFF3F9FF), Color(0xFFEAF3FF)]),
        borderRadius: BorderRadius.circular(
          Responsive.isMobile(context) ? 0 : 20,
        ),
      ),
      child: Column(
        children: const [
          _AvailabilityText(),
          SizedBox(height: 12),
          Divider(color: DT.border, thickness: 1, height: 24),
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
    return Responsive.isMobile(context)
        ? Column(
            children: [
              Text(
                "Reach out Today.",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: 4,),
              Text(
                "We’re available Monday–Friday, 9 AM – 6 PM (IST).",
                style: TextStyle(fontSize: 14, color: DT.body),
              ),
            ],
          )
        : RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 15, color: DT.body),
              children: [
                TextSpan(
                  text: "Reach out Today. ",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                TextSpan(
                  style: TextStyle(fontSize: 14),
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
    return Responsive.isMobile(context)
        ? Column(
            children: const [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _TrustItem(
                    icon: Icons.inventory_2_outlined,
                    label: "Bulk Supply Specialists",
                    textSize: 13,
                  ),
                  _TrustItem(
                    icon: Icons.handshake_outlined,
                    label: "Trusted by Hotels & Brands",
                    textSize: 13,
                  ),
                ],
              ),
              SizedBox(height: 8),
              _TrustItem(
                icon: Icons.verified_outlined,
                label: "Quality Certified",
                textSize: 15,
              ),
            ],
          )
        : Wrap(
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
  final double? textSize;
  final double? iconSize;

  const _TrustItem({
    required this.icon,
    required this.label,
    this.textSize,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: iconSize ?? 18, color: Colors.blue),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: textSize ?? 14,
            fontWeight: FontWeight.w500,
            color: DT.heading,
          ),
        ),
      ],
    );
  }
}
