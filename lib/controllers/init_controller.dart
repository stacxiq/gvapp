import 'package:get/get.dart';
import 'package:greenvilllage/models/settings.dart';
import 'package:greenvilllage/repositories/settings_repository.dart';

class InitController extends GetxController {
  RxList<Setting> settings = <Setting>[].obs;
  fetchSettings() async {
    var response = await settingsRepository.getServices();

    response.fold((l) => null, (r) {

      final settingsList = r.data;

     
      for (var element in settingsList) {
        settings.add(Setting.fromMap(element));
      }
      print(settings);
    });

  }

  @override
  void onInit() {
    fetchSettings();
    super.onInit();
  }
}
