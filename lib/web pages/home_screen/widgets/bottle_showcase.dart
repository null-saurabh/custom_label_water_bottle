import 'package:flutter/material.dart';
import '../../../core/theme/design_token.dart';
import '../../../widgets/page_container.dart';

class BottleShowcase extends StatelessWidget {
  const BottleShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient: DT.softBlueGradient,
        borderRadius: BorderRadius.circular(20),

      ),
      // color: DT.lightBg,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: PageContainer(
        child: Column(
          children: [
            Text(
              'Your brand can look this premium',
             style: Theme.of(context).textTheme.displayMedium,
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

            Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}
