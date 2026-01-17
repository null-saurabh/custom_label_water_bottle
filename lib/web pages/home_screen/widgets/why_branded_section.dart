import 'package:flutter/material.dart';
import '../../../core/theme/design_token.dart';
import '../../../widgets/page_container.dart';

class WhyBrandedSection extends StatelessWidget {
  const WhyBrandedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: DT.softBlueGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: PageContainer(
        child: Column(
          children: [
            // Title
             Text(
              'Why Branded Water Matters',
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

            // ---------- PART 1 : WHY CARDS ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _WhyCard(
                  icon: 'assets/icons/brand_recall.png',
                  title: 'Brand Recall',
                  desc: 'Customers remember your logo',
                  // height: 36,

                ),
                _WhyCard(
                  icon: 'assets/icons/premium_perception.png',
                  title: 'Premium Perception',
                  desc: 'Elevates trust & quality',
                  color: Colors.blue,


                ),
                _WhyCard(
                  icon: 'assets/icons/hygiene_confidence.png',
                  title: 'Hygiene Confidence',
                  desc: 'Sealed for safety & purity',

                ),
                _WhyCard(
                  icon: 'assets/icons/instagram.png',
                  title: 'Instagram Visibility',
                  desc: 'Perfect for social sharing',

                ),
              ],
            ),

            const SizedBox(height: 24),

            // ---------- SEPARATOR ----------
            Container(
              width: double.infinity,
              height: 1,
              color: DT.border,
            ),

            const SizedBox(height: 20),

            // ---------- PART 2 : TRUST STRIP ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _TrustItem(
                  icon: 'assets/icons/quality_certified.png',
                  label: 'Quality Certified',
                  color: Colors.blue,
                ),
                SizedBox(width: 20,),
                _TrustItem(
                  icon: 'assets/icons/food_grade_packing.png',
                  label: 'Food-Grade Packaging',
                  color: Colors.blue,


                ),
                SizedBox(width: 20,),

                _TrustItem(
                  icon: 'assets/icons/bulk_supply.png',
                  label: 'Bulk Supply Ready',
                  color: Colors.blue,


                ),
                SizedBox(width: 20,),

                _TrustItem(
                  icon: 'assets/icons/hospitality.png',
                  label: 'Hospitality Trusted',

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _WhyCard extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;
  final Color? color;

  const _WhyCard({
    required this.icon,
    required this.title,
    required this.desc, this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// ICON CONTAINER (matches image UI)
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(width: 2,
              color: const Color(0xFFD9E4FF),
            ),
          ),
          child: Center(
            child: Image.asset(
              icon,
              color: color,
              height: 36,
            ),
          ),
        ),

        const SizedBox(height: 12),

        /// TITLE
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: DT.heading,
          ),
        ),

        // const SizedBox(height: 4),

        /// DESCRIPTION
        Text(
          desc,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14.5,
            color: DT.body,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}


class _TrustItem extends StatelessWidget {
  final String icon;
  final String label;
  final Color? color;

  const _TrustItem({
    required this.icon,
    required this.label,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, height: 22,color: color,),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: DT.heading,
          ),
        ),
      ],
    );
  }
}
