import 'package:flutter/material.dart';
import '../../../core/responsive.dart';
import '../../../core/theme/design_token.dart';
import '../../../widgets/page_container.dart';

class BottleShowcase extends StatelessWidget {
  const BottleShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: DT.softBlueGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      // color: DT.lightBg,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Text(
            'Your brand can look this premium',
            style: Responsive.isMobile(context)
                ? Theme.of(context).textTheme.titleMedium
                : Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),

          Stack(
            alignment: Alignment.center,
            children: [
              // Base thin line
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: 1,
                color: DT.border,
              ),

              // Center accent line
              Container(
                width: 64,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          !Responsive.isMobile(context)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(5, (i) {
                      // Height curve (center biggest)
                      final heights = [240.0, 280.0, 320.0, 280.0, 240.0];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Image.asset(
                          'assets/bottles/sample_$i.png',
                          height: heights[i],
                        ),
                      );
                    }),
                  ),
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(5, (i) {
                  // Height curve (center biggest)
                  // Base height relative to screen width
                  final baseHeight = MediaQuery.of(context).size.width * 0.45;

                  final heightFactors = [0.9, 0.95, 1.0, 0.95, 0.9];

                  return Image.asset(
                    'assets/bottles/sample_$i.png',
                    height: baseHeight * heightFactors[i],
                  );
                }),
              ),
        ],
      ),
    );
  }
}
