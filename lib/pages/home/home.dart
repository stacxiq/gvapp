import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:greenvilllage/controllers/service_controller.dart';
import 'package:greenvilllage/global/widgets/logo_widget.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:greenvilllage/pages/home/widgets/first_tab_widget.dart';
import 'package:greenvilllage/pages/home/widgets/second_tab_widget.dart';
import 'package:greenvilllage/pages/home/widgets/tabs_widget.dart';

import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: context.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacing(height: 4),
                  const LogoWidget(),
                  const VerticalSpacing(height: 15),
                  const TabsWidget(),
                  SizedBox(
                    width: context.width,
                    height: context.height + (context.height * 0.1),
                    child: const TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        FirstTabWidget(),
                        SecondTabWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
