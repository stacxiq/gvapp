import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/models/form_request.dart';
import 'package:greenvilllage/repositories/form_repositories.dart';

class UserFormController extends GetxController {
  sendData(String name, String certificate, String job, String comment) async {
    EasyLoading.show();
    final response = await formRepository.postForm(
      FormRequest(
          name: name, certificate: certificate, comment: comment, job: job),
    );

    response.fold((l) {
      EasyLoading.dismiss();
    }, (r) {
      EasyLoading.dismiss();
      Get.back();
    });
  }
}
