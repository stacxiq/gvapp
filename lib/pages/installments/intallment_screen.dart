import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/installments_controller.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/widgets/logo_widget.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:intl/intl.dart';

class InstallmentScreen extends StatelessWidget {
  const InstallmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    InstallmentController installmentController =
        Get.put(InstallmentController());
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (installmentController.isLoading.value) {
            return SizedBox(
              height: context.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackButton(),
                    const LogoWidget(),
                    const VerticalSpacing(height: 12),
                    ListView.builder(
                      itemCount: installmentController.installments.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Column(
                            children: [
                              ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'المبلغ المدفوع: ${installmentController.installments[index].amount}',
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: AppColors.appPrimaryColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      DateFormat('yMMMMd').format(
                                        DateTime.parse(installmentController
                                            .installments[index].date),
                                      ),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                subtitle: Text(
                                  installmentController
                                      .installments[index].note,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
