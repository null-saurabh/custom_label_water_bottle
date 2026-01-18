import 'package:cwbl_website/core/theme/design_token.dart';
import 'package:cwbl_website/core/theme/gradients.dart';
import 'package:flutter/material.dart';
import '../core/responsive.dart';
import 'premium_button.dart';
import 'package:go_router/go_router.dart';

class SiteHeader extends StatelessWidget {
  final Color? bgColor;
  const SiteHeader({super.key, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding:  EdgeInsets.symmetric(horizontal: Responsive.isMobile(context)? 16: 48),
      decoration: BoxDecoration(
        gradient: bgColor == null ? DT.heroGradient : AppGradients.footerTop,
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
                  height: Responsive.isMobile(context)?32:40, // smaller, tighter like reference
                  fit: BoxFit.contain,
                  color: Colors.blue,
                ),
                 SizedBox(width:Responsive.isMobile(context)?4: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children:  [
                    Text(
                      'Custom Label',
                      style: TextStyle(
                        fontSize: Responsive.isMobile(context)?14:16,
                        fontWeight: FontWeight.w600,
                        color: DT.heading,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      'Water Bottles',
                      style: TextStyle(
                        fontSize: Responsive.isMobile(context) ?11:13,
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
          NavItem(
            label: 'Home',
            onTap: () {
              context.go('/'); // HOME ROUTE
            },
          ),
          Responsive.isMobile(context)
          ?NavItem(
            label: 'Inquiry',
            onTap: () {
              context.go('/inquiry'); // HOME ROUTE
            },
          )
              :NavItem(
            label: 'Samples',
            onTap: () {
              context.go('/contact'); // HOME ROUTE
            },
          ),

          NavItem(
            label: 'Contact',
            onTap: () {
              context.go('/contact'); // HOME ROUTE
            },
          ),

          Responsive.isMobile(context) ? SizedBox() :const Spacer(),





          Responsive.isMobile(context)
              ? SizedBox()
              : bgColor == null
              ? HeaderActionButton(
    text: 'Request Bulk Order',
    onTap: () {
    context.go('/inquiry');
    },
    )
              : Row(
                  children: [
                    Icon(Icons.facebook, color: Colors.grey, size: 28),
                    SizedBox(width: 8),
                    Image.asset(
                      'assets/icons/instagram_2.png',
                      color: Colors.grey,
                      height: 28,
                    ),
                    SizedBox(width: 4),
                    Image.asset(
                      'assets/icons/twitter.png',
                      color: Colors.grey,
                      height: 32,
                    ),
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
        padding:  EdgeInsets.symmetric(horizontal: Responsive.isMobile(context)?6:16),
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




class HeaderActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const HeaderActionButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 28),
          decoration: BoxDecoration(
            color: const Color(0xFF3558C9),
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3558C9).withOpacity(0.25),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.2,
            ),
          ),
        ),
      ),
    );
  }
}
