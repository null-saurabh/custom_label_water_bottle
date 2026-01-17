import 'package:cwbl_website/web%20pages/home_screen/widgets/lifestyle_cta_section.dart';
import 'package:flutter/material.dart';
import 'widgets/site_header.dart';
import 'widgets/hero_section.dart';
import 'widgets/bottle_showcase.dart';
import 'widgets/why_branded_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          SiteHeader(),
          HeroSection(),
          SizedBox(height: 36,),
          BottleShowcase(),
          SizedBox(height: 36,),
          WhyBrandedSection(),
          SizedBox(height: 36,),
          LifestyleSection(),
        ],
      ),
    );
  }
}
