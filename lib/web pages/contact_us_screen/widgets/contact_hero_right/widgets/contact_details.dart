import 'package:flutter/material.dart';

import '../../../../../core/responsive.dart' show Responsive;
import '../../../../../core/theme/design_token.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 550),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: Responsive.isMobile(context) ?10:4,
                  child: _InfoCard(
                    icon: Icons.phone,
                    title: "Call Us",
                    value: "+91 8112552320",
                    onTap: () => launchPhone("+918112552320"),
                  ),
                ),
                 SizedBox(width:Responsive.isMobile(context) ? 8:24),
                Expanded(
                  flex: Responsive.isMobile(context) ?14:6,
                  child: _InfoCard(
                    icon: Icons.email,
                    title: "Email Us",
                    value: "support@yourwater.com",
                    onTap:() => launchEmail("support@yourwater.com"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _WideInfoCard(
              icon: Icons.location_on,
              title: "Visit Us",
              value: "123, Business Complex, Bengaluru, India",
              helper: "Show on Google Maps",
              onTap: () => launchMaps(
                "Patna, India",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> launchPhone(String phone) async {
  final uri = Uri(scheme: 'tel', path: phone);

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch phone';
  }
}

Future<void> launchEmail(String email) async {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
  );

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch email';
  }
}

Future<void> launchMaps(String address) async {
  final uri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}',
  );

  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch maps';
  }
  }




class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;


  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: 260,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
        decoration: _cardDecoration,
        child: Column(
          children: [
            _IconBubble(icon),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: DT.heading,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: DT.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _WideInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String helper;
  final VoidCallback onTap;


  const _WideInfoCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.helper, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 540,
        padding: const EdgeInsets.all(28),
        decoration: _cardDecoration,
        child: Column(
          children: [
            _IconBubble(icon),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: DT.heading,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: DT.body,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  helper,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 4,),
                Icon(Icons.pin_drop,color: Colors.grey,size: 20,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class _IconBubble extends StatelessWidget {
  final IconData icon;

  const _IconBubble(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        color: Color(0xffeff4fd),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Color(0xff5b7cc5),
        size: 26,
      ),
    );
  }
}

final _cardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.05),
      blurRadius: 30,
      offset: const Offset(0, 18),
    ),
  ],
);
