import 'package:flutter/material.dart';
import 'package:brosd_web/widgets/top_navbar.dart';
import 'package:brosd_web/widgets/main_navbar.dart';
import 'package:brosd_web/widgets/drawer_widget.dart';
import 'package:brosd_web/widgets/hero_section.dart';
import 'package:brosd_web/widgets/footer_section.dart';
import 'package:brosd_web/widgets/top_professionals.dart';
import 'package:brosd_web/widgets/service_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopNavbar(),
            MainNavbar(),
            HeroSection(),
            ServiceSection(),
            TopProfessionals(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
