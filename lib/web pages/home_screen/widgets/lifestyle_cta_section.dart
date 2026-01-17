import 'package:cwbl_website/core/theme/design_token.dart';
import 'package:flutter/material.dart';
import '../../../widgets/page_container.dart';
import '../../../widgets/premium_button.dart';

class LifestyleSection extends StatelessWidget {
  const LifestyleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 460,
            child: Image.asset(
              'assets/images/lifestyle_bg.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          decoration:  BoxDecoration(
            gradient: DT.softBlueGradient,

          ),
          // color: DT.lightBg,
          padding: const EdgeInsets.symmetric(vertical: 28),
          child: PageContainer(
            child: Column(
              children: [
                const Text(
                  'Ready to brand your water?',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: DT.heading,
                  ),
                ),
                const SizedBox(height: 8),
                PremiumButton(
                  text: 'Request Bulk Order',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
