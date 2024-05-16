import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/core/network_service.dart';
import 'package:greenvilllage/global/constants/constants.dart';
import 'package:greenvilllage/models/login_request.dart';
import 'package:greenvilllage/pages/tabs/tabs.dart';
import 'package:greenvilllage/repositories/auth_repository.dart';
import 'package:hive/hive.dart';

class LoginController extends GetxController {
  Box tokenBox = Get.find<Box>(tag: TOKEN);

  login(LoginRequest loginRequest) async {
    EasyLoading.show(status: 'جاري تسجيل الدخول');
    final auth = await authRepository.login(loginRequest);

    auth.fold((l) {
      if (l.message == 'Email & Password does not match with our record.') {
        Get.snackbar('خطأ', 'رقم الهاتف او كلمة المرور غير متطابقين',
            snackPosition: SnackPosition.BOTTOM);
      }

      EasyLoading.dismiss();
    }, (r) async {
      tokenBox.put(TOKEN, r.data['token']);
      await Network.initializeInterceptors().then((value) {
        EasyLoading.dismiss();
        Get.offAll(() => const TabsScreen());
      });
    });
  }
}
