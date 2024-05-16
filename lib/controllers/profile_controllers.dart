import 'package:get/get.dart';
import 'package:greenvilllage/models/user.dart';
import 'package:greenvilllage/repositories/profile_repository.dart';

class ProfileController extends GetxController {
  Rx<User> user = User().obs;

  RxBool isLoading = true.obs;
  fetchProfile() async {
    final response = await profileRepository.getProfile();

    response.fold((l) {
      print(l.message);
      isLoading.value = false;
    }, (r) {
      isLoading.value = false;
      user.value = User.fromMap(r.data);
    });
  }

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }
}
