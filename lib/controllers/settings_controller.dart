import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/splash_controller.dart';
import 'package:greenvilllage/core/network_service.dart';
import 'package:greenvilllage/global/constants/constants.dart';
import 'package:greenvilllage/pages/splash/splash.dart';
import 'package:greenvilllage/repositories/auth_repository.dart';
import 'package:hive/hive.dart';

class SettingsXController extends GetxController {
  RxBool isDarkMode = false.obs;

  Box tokenBox = Get.find<Box>(tag: TOKEN);

  changeTheme(bool value) {
    isDarkMode.value = value;

    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  deleteAccount() async {
    final deleteResponse = await authRepository.deleteAccount();

    deleteResponse.fold(
      (l) {
        Get.snackbar('Error', l.message);
      },
      (r) {
        print(r.data);
        logout();
      },
    );
  }

  logout() async {
    Get.delete<SplashController>();
    tokenBox.delete(TOKEN);
    tokenBox.clear();

    await Network.initializeInterceptors().then((value) {
      Get.offAll(() => SplashPage());
    });
  }
}
