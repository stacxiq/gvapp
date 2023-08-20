import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: context.width,
          height: context.height * 0.56,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ),
      ),
    );
  }
}
