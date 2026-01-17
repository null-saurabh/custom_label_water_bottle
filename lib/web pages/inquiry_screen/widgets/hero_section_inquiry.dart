import 'package:flutter/material.dart';

import '../../../core/theme/design_token.dart';

class HeroSectionInquiry extends StatelessWidget {
  const HeroSectionInquiry({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Let’s Create Your\nCustom Branded Water",
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                      color: Color(0xFF1F2A44),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Tell us about your brand and requirements.\n"
                        "Our team will share samples, pricing & timelines.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF5A6B85),
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: 24),
                  // Wrap(
                  //   spacing: 16,
                  //   runSpacing: 12,
                  //   children: [
                  //     HeroPoint("No online payment required"),
                  //     HeroPoint("Bulk supply specialists"),
                  //     HeroPoint("Trusted by hotels & restaurants"),
                  //   ],
                  // ),\
                  SizedBox(
                    width: 480,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ───────────── Top Divider
                        Divider(
                          color: DT.border,
                          thickness: 1,
                          height: 24,
                        ),

                        // ───────────── First Row (2 items)
                        Row(
                          children: const [
                            HeroPoint("No online payment required"),
                            SizedBox(width: 32),
                            HeroPoint("Bulk supply specialists"),
                          ],
                        ),

                        // ───────────── Bottom Divider
                        Divider(
                          color: DT.border,
                          thickness: 1,
                          height: 24,
                        ),

                        // ───────────── Second Row (single item)
                        const HeroPoint("Trusted by restaurants & hotels"),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(width: 60),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/bottles/sample_4_no_shadow.png',
                height: 420,
              ),
            )
          ],
        ),
      ),
    );
  }
}



class HeroPoint extends StatelessWidget {
  final String text;
  const HeroPoint(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check, color: Color(0xFF3B82F6), size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 15, color: Color(0xFF3A4A66)),
        ),
      ],
    );
  }
}
