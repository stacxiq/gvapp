import 'package:get/get.dart';
import 'package:greenvilllage/pages/login/login.dart';
import 'package:greenvilllage/pages/onboarding/onboarding.dart';
import 'package:greenvilllage/pages/tabs/tabs.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => WelcomePage());
    });
  }
}
