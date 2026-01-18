import 'package:cwbl_website/core/theme/design_token.dart';
import 'package:flutter/material.dart';
import 'premium_button.dart';
import 'package:go_router/go_router.dart';


class SiteHeader extends StatelessWidget {
  final Color? bgColor;
  const SiteHeader({super.key, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      decoration: BoxDecoration(
        gradient: bgColor == null ? DT.heroGradient : null,
        color: bgColor,
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
          NavItem(label:'Samples',onTap: (){
            context.go('/contact'); // HOME ROUTE
          }),
          NavItem(label:'Pricing',onTap: (){
            context.go('/contact'); // HOME ROUTE
          }),
          NavItem(label:'Contact',onTap: (){
            context.go('/contact'); // HOME ROUTE
          },),
          const Spacer(),

          bgColor == null
          ?PremiumButton(text: 'Request Bulk Order', onTap: () {
            context.go('/inquiry');
          })
          : Row(
            children: [
              Icon(Icons.facebook,color: Colors.grey,size: 28,),
              SizedBox(width: 8,),
              Image.asset('assets/icons/instagram_2.png',color: Colors.grey,
                height: 28,),
              SizedBox(width: 4,),
              Image.asset('assets/icons/twitter.png',color: Colors.grey,
                height: 32,),
            ],
          ),
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
