import 'package:cwbl_website/web%20pages/admin_homepage.dart';
import 'package:cwbl_website/web%20pages/contact_us_screen/contact_screen.dart';
import 'package:cwbl_website/web%20pages/home_screen/homepage.dart';
import 'package:cwbl_website/web%20pages/inquiry_screen/inquiry_page.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (_, __) => const HomePage()),
    GoRoute(path: '/inquiry', builder: (_, __) => const BulkEnquiryPage()),
    GoRoute(path: '/contact', builder: (_, __) => const ContactScreen()),
    GoRoute(path: '/admin', builder: (_, __) => const AdminPage()),
  ],
);
