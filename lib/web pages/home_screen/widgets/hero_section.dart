import 'package:flutter/material.dart';
import '../../../core/theme/design_token.dart';
import '../../../widgets/page_container.dart';
import '../../../widgets/premium_button.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class HeroSectionHomePage extends StatelessWidget {
  const HeroSectionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: DT.heroGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),

      ),

      // color: DT.lightBg,
      // padding: const EdgeInsets.symmetric(vertical: 96),

      child: PageContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // LEFT
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 96),
                // padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Turn Every Bottle Into\nYour Brand Ambassador',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 24),
                     Text(
                      'Custom-labeled drinking water bottles for restaurants, hotels & food brands',
                        style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        PremiumButton(
                          text: 'Request Bulk Order',
                          onTap: () {
                            context.go('/inquiry');

                          },
                        ),
                        const SizedBox(width: 16),
                        PremiumButton(
                          text: 'View Sample Bottles',
                          isPrimary: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // RIGHT (Bottle)
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/bottles/sample_0.png',
                height: 520,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
