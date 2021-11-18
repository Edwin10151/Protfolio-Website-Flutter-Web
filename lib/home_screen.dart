import 'package:flutter/material.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/sections/about_section.dart';
import 'package:web_app/sections/contact_section.dart';
import 'package:web_app/sections/recent_work_section.dart';
import 'package:web_app/sections/service_section.dart';
import 'package:web_app/sections/top_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            SizedBox(height: kDefaultPadding * 2),
            AboutSection(),
            ServiceSection(),
            RecentWorkSection(),
            // SizedBox(height: kDefaultPadding),
            // ContactSection(),
            // This SizeBox just for demo
            // SizedBox(
            //   height: 500,
            // )
          ],
        ),
      ),
    );
  }
}
