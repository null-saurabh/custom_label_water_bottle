import 'package:flutter/material.dart';
import '../../../../../core/theme/design_token.dart';

class ReachOutHeader extends StatelessWidget {
  const ReachOutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Reach out today.",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: DT.heading,
          ),
        ),
        SizedBox(height: 0),
        Text(
          "We’re available Monday–Friday, 9 AM – 6 PM (IST)",
          style: TextStyle(
            fontSize: 14,
            color: DT.body,
          ),
        ),
      ],
    );
  }
}
