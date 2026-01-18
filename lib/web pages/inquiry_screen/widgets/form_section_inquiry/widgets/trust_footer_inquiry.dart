import 'package:flutter/material.dart';

import '../../../../../core/responsive.dart';
import '../../../../../core/theme/design_token.dart';

class TrustFooter extends StatelessWidget {
  const TrustFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                runSpacing: 8,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _TrustItem(
                    "Quality Certified",
                    'assets/icons/quality_certified_2.png',
                  ),
                  SizedBox(width: 24),
                  _TrustItem(
                    "Food-Grade Packaging",
                    'assets/icons/food_grade_packing.png',
                  ),
                ],
              ),
              SizedBox(height: 12),
              Center(
                child: _TrustItem(
                  "Bulk Supply Ready",
                  'assets/icons/bulk_supply_2.png',
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _TrustItem(
                "Quality Certified",
                'assets/icons/quality_certified_2.png',
              ),
              SizedBox(width: 24),
              _TrustItem(
                "Food-Grade Packaging",
                'assets/icons/food_grade_packing.png',
              ),
              SizedBox(width: 24),
              _TrustItem("Bulk Supply Ready", 'assets/icons/bulk_supply_2.png'),
            ],
          );
  }
}

class _TrustItem extends StatelessWidget {
  final String text;
  final String icon;

  const _TrustItem(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          icon,
          height: Responsive.isMobile(context) ? 22 : 22,
          color: Colors.blueAccent,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: Responsive.isMobile(context) ? 14 : 14,
            color: DT.heading,
          ),
        ),
      ],
    );
  }
}
