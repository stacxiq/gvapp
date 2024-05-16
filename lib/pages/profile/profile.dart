import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/profile_controllers.dart';
import 'package:greenvilllage/controllers/settings_controller.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/constants/functions.dart';
import 'package:greenvilllage/global/widgets/logo_widget.dart';
import 'package:greenvilllage/pages/chat/chat_screen.dart';
import 'package:greenvilllage/pages/installments/intallment_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    SettingsXController settingsController = Get.put(SettingsXController());

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Skeletonizer(
            enabled: profileController.isLoading.value,
            child: Column(
              children: [
                const LogoWidget(),
                Gap(context.height * 0.02),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: context.height * 0.02, vertical: 0.02),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: const Icon(Iconsax.user),
                    title: const Text(
                      'الاسم',
                      style: TextStyle(
                        color: AppColors.appPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      (profileController.user.value.name ?? '').toUpperCase(),
                    ),
                  ),
                ),
                Gap(context.height * 0.02),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: context.height * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: const Icon(Iconsax.mobile),
                    title: const Text(
                      'رقم الهاتف',
                      style: TextStyle(
                        color: AppColors.appPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      profileController.user.value.email?.isEmpty ?? true
                          ? ''
                          : (profileController.user.value.email ?? '')
                              .substring(0, 11),
                    ),
                  ),
                ),
                Gap(context.height * 0.02),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: context.height * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    leading: const Icon(Iconsax.map),
                    title: const Text(
                      'العنوان',
                      style: TextStyle(
                        color: AppColors.appPrimaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      (profileController.user.value.address ?? ''),
                    ),
                  ),
                ),
                Gap(context.height * 0.02),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: context.height * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () {
                      Get.to(() => MyChatApp());
                    },
                    leading: const Icon(Iconsax.message),
                    title: const Text('التواصل مع الدعم الفني'),
                  ),
                ),
                Gap(context.height * 0.02),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: context.height * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () {
                      Get.to(() => InstallmentScreen());
                    },
                    leading: Icon(Iconsax.wallet),
                    title: Text('الاقساط المدفوعه'),
                  ),
                ),
                Gap(context.height * 0.02),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: context.height * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () {
                      settingsController.deleteAccount();
                    },
                    leading: const Icon(Iconsax.trash),
                    title: const Text('حذف الحساب'),
                  ),
                ),
                Gap(context.height * 0.02),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: context.height * 0.02),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListTile(
                    onTap: () {
                      settingsController.logout();
                    },
                    leading: const Icon(Iconsax.logout),
                    title: const Text('تسجيل خروج'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildCover() => Container(
        color: Colors.grey,
        child: Obx(
          () => Image.network(
            getImage(profileController.user.value.back_img ?? ''),
          ),
        ),
      );
  _buildProfileImage(BuildContext context) => Obx(
        () => CircleAvatar(
          radius: context.height * 0.08,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: context.height * 0.075,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              getImage(profileController.user.value.image ?? ''),
            ),
          ),
        ),
      );
}
