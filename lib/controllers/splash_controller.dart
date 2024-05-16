import 'package:get/get.dart';
import 'package:greenvilllage/global/constants/constants.dart';
import 'package:greenvilllage/pages/onboarding/onboarding.dart';
import 'package:greenvilllage/pages/tabs/tabs.dart';
import 'package:hive/hive.dart';

class SplashController extends GetxController {
  Box settingsBox = Get.find<Box>(tag: SETTINGS);

  @override
  void onInit() {
    on();
    super.onInit();
  }

  void on() {
    Future.delayed(const Duration(seconds: 7), () {
      bool isFirstTime = settingsBox.get('isFirstTime', defaultValue: true);
      if (isFirstTime) {
        Get.offAll(() => const WelcomePage());
      } else {
        Get.offAll(() => const TabsScreen());
      }
    });
  }
}
