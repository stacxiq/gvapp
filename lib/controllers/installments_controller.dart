import 'package:get/get.dart';
import 'package:greenvilllage/models/installments.dart';
import 'package:greenvilllage/repositories/installments_repository.dart';

class InstallmentController extends GetxController {
  RxList<Installment> installments = RxList<Installment>();
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    fetchInstallments();
    super.onInit();
  }

  fetchInstallments() async {
    final installmentsResponse = await installmentsRepository.getInstallments();

    installmentsResponse.fold((l) {
      isLoading.value = false;
    }, (r) {
      final installmentsList = r.data;

      for (var element in installmentsList) {
        installments.add(Installment.fromMap(element));
      }
      isLoading.value = false;
    });
  }
}
