import 'package:flutter/material.dart';

import '../../../../../core/theme/design_token.dart';

class TrustFooter extends StatelessWidget {
  const TrustFooter({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        _TrustItem("Quality Certified",'assets/icons/quality_certified_2.png'),
        SizedBox(width: 24),
        _TrustItem("Food-Grade Packaging",'assets/icons/food_grade_packing.png'),
        SizedBox(width: 24),
        _TrustItem("Bulk Supply Ready",'assets/icons/bulk_supply_2.png'),
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
      children: [
        Image.asset(icon, height: 22,color: Colors.blueAccent,),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(fontSize: 14, color: DT.heading),
        ),
      ],
    );
  }
}

