import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/core/network_service.dart';
import 'package:greenvilllage/global/constants/constants.dart';
import 'package:greenvilllage/models/register_request.dart';
import 'package:greenvilllage/pages/tabs/tabs.dart';
import 'package:greenvilllage/repositories/auth_repository.dart';
import 'package:hive/hive.dart';

class RegisterController extends GetxController {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Box tokenBox = Get.find<Box>(tag: TOKEN);
  register(RegisterRequest registerRequest) async {
    if (registerRequest.phone.length < 11) {
      Get.snackbar('خطأ', 'رقم الهاتف غير صحيح');
    } else if (registerRequest.password.length < 6) {
      Get.snackbar('خطأ', 'كلمة المرور غير صحيحة');
    } else {

      EasyLoading.show(status: 'جاري التسجيل');
      final resultData = await authRepository.register(registerRequest);

      resultData.fold((l) {
        EasyLoading.dismiss();
        if (l.errors!.containsKey('phone')) {
          Get.snackbar(
            'خطأ',
            'رقم الهاتف مستخدم مسبقا',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            'خطأ',
            'حدث خطأ اثناء التسجيل',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }, (r) async {
        EasyLoading.dismiss();
        tokenBox.put(TOKEN, r.data['token']);
        tokenBox.put(TOKEN, r.data['token']);

        await _firebaseMessaging.getToken().then((token) async {
          await Network.initializeInterceptors().then((value) async {
            final response = await authRepository.updateToken(token!);
            response.fold((l) {
              print(l.message);
              print(l.errors);
              print(l.statusCode);
            }, (r) {
              Get.offAll(() => const TabsScreen());
            });
          });
        });
      });
    }
  }
}
