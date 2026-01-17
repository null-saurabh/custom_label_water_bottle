import 'package:cwbl_website/core/theme/design_token.dart';
import 'package:flutter/material.dart';
import '../../../widgets/premium_button.dart';
import 'package:go_router/go_router.dart';


class SiteHeader extends StatelessWidget {
  const SiteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      decoration: BoxDecoration(
        gradient: DT.heroGradient,
        // color: Colors.white.withOpacity(0.96),
        border: Border(bottom: BorderSide(color: DT.border)),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.go('/'); // HOME ROUTE
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/main_logo.png',
                  height: 40, // smaller, tighter like reference
                  fit: BoxFit.contain,
                  color: Colors.blue,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Custom Label',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: DT.heading,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'Water Bottles',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: DT.body,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          NavItem(label:'Home',onTap: (){
            context.go('/'); // HOME ROUTE
          },),
          NavItem(label:'Samples'),
          NavItem(label:'Pricing'),
          NavItem(label:'Contact'),
          const Spacer(),

          PremiumButton(text: 'Request Bulk Order', onTap: () {
            context.go('/inquiry');
          }),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const NavItem({super.key, required this.label, this.onTap});



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // borderRadius: BorderRadius.circular(6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: DT.heading,
          ),
        ),
      ),
    );
  }
}
