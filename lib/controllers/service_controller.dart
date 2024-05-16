
import 'package:get/get.dart';
import 'package:greenvilllage/models/service.dart';
import 'package:greenvilllage/repositories/service_repository.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<ServiceModel> serviceList = <ServiceModel>[
//     ServiceModel(
//       id: 3,
//       title: "منازل نوع 200 متر مربع",
//       content: '''
// إجمالي مساحة البناء: 215.5 متر مربع
// طابقین:
// صالة مع 4 غرف
// الطابق الأرضي:
// الكراج + الممشى: 43 متر مربع
// الحدیقة: 20 متر مربع
// صالة: 19.6 متر مربع
// غرفة المعیشة: 24.3 متر مربع
// المطبخ: 8.9 متر مربع
// غرفة النوم الماستر: 18.4 متر مربع
// الطابق الأول:
// غرفة نوم: 18 متر مربع
// غرفة نوم ماستر: 19.6 متر مربع
// الشرفة: 9.87 متر مربع
// ''',
//       seen: 0,
//       image: "assets/images/project_img03.jpg",
//       createdAt: DateTime.now(),
//     ),
//     ServiceModel(
//       id: 1,
//       title: "منازل نوع 240 متر مربع",
//       content: '''
// إجمالي مساحة البناء :244 متر مربع
// طابقین: صالة مع 4 غرف
// الطابق الأرضي:
// الكراج + الممشى: 80 متر مربع
// الحدیقة: 16 متر مربع
// صالة: 22.5 متر مربع
// غرفة المعیشة : 29.3 متر مربع
// المطبخ: 9.45 متر مربع
// غرفة النوم الماستر 15.75 متر مربع
// الطابق الأول:
// غرفة نوم: 15.75 متر مربع
// غرفة نوم ماستر: 22.5 متر مربع
// غرفة نوم: 20.46 متر مربع
// الشرفة: 10.34 متر مربع
// ''',
//       seen: 0,
//       image: "assets/images/project_img01.jpg",
//       createdAt: DateTime.now(),
//     ),
//     ServiceModel(
//       id: 2,
//       title: "منازل نوع 300 متر مربع",
//       content: '''
// إجمالي مساحة البناء :300 متر مربع
// طابقین:
// صالة مع 4 غرف
// الطابق الأرضي:
// الكراج + الممشى: 109 متر مربع
// الحدیقة: 23 متر مربع
// الصالة: 33 متر مربع
// غرفة المعیشة : 35.42 متر مربع
// المطبخ: 13.34 متر مربع
// غرفة النوم الماستر 19.2 متر مربع
// الطابق الأول:
// غرفة نوم: 19.2 متر مربع
// غرفة نوم ماستر: 20 متر مربع
// غرفة نوم: 25.3 متر مربع
// الشرفة: 21.46 متر مربع
// ''',
//       seen: 0,
//       image: "assets/images/project_img02.jpg",
//       createdAt: DateTime.now(),
//     ),
  ].obs;

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  fetchApi() async {
    final servicesResponse = await servicesRepository.getServices();

    servicesResponse.fold((l) {
      isLoading.value = false;
      print(l);
    }, (r) {
      isLoading.value = false;

      print(r.data);

      final data = r.data.map((e) => ServiceModel.fromMap(e)).toList();
      for (var item in data) {
        serviceList.add(item);
      }
    });
  }
}
