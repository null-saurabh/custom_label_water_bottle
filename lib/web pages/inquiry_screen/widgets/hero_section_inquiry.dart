import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF3F9FF),
            Color(0xFFEAF3FF),
          ],
        ),
      ),
      child: Center(
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
                    Wrap(
                      spacing: 16,
                      runSpacing: 12,
                      children: [
                        HeroPoint("No online payment required"),
                        HeroPoint("Bulk supply specialists"),
                        HeroPoint("Trusted by hotels & restaurants"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 60),
              SizedBox(
                height: 320,
                child: Image.asset(
                  'assets/bottles/sample_2.png',
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
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
        const Icon(Icons.check_circle, color: Color(0xFF3B82F6), size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 15, color: Color(0xFF3A4A66)),
        ),
      ],
    );
  }
}
