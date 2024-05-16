import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/widgets/logo_widget.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:greenvilllage/pages/userform/controller/user_form_controller.dart';

class UserFormScreen extends StatelessWidget {
  UserFormScreen({super.key});

  final nameTextEditingController = TextEditingController();
  final certificateTextEditingController = TextEditingController();
  final workTextEditingController = TextEditingController();
  final commentTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserFormController userFormController = Get.put(UserFormController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButton(),
                const VerticalSpacing(height: 10),
                const LogoWidget(),
                const VerticalSpacing(height: 5),
                Center(
                  child: Text(
                    'الاستبيان',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appPrimaryColor,
                    ),
                  ),
                ),
                const VerticalSpacing(height: 10),
                Text(
                  'الاسم',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.appPrimaryColor),
                ),
                const VerticalSpacing(height: 6),
                TextFormField(
                  controller: nameTextEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'ادخل  اسمك الثلاثي',
                    hintStyle: TextStyle(
                      color: const Color(0xFF878787),
                      fontSize: 12.sp,
                      fontFamily: 'TheSans',
                      fontWeight: FontWeight.w400,
                    ),
                    fillColor: const Color(0xFFF6F6F6),
                    border: InputBorder.none,
                  ),
                ),
                const VerticalSpacing(height: 10),
                Text(
                  'الشهادة',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.appPrimaryColor),
                ),
                const VerticalSpacing(height: 6),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: certificateTextEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText:
                        'ادخل مستوى العلمي : بكالوريوس , ماجستير , دكتوراه',
                    hintStyle: TextStyle(
                      color: const Color(0xFF878787),
                      fontSize: 12.sp,
                      fontFamily: 'TheSans',
                      fontWeight: FontWeight.w400,
                    ),
                    fillColor: const Color(0xFFF6F6F6),
                    border: InputBorder.none,
                  ),
                ),
                const VerticalSpacing(height: 10),
                Text(
                  'العمل',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.appPrimaryColor),
                ),
                const VerticalSpacing(height: 6),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: workTextEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText:
                        'ادخل مجال عملك : محاسب , مهندس , طبيب , مدرس , طالب',
                    hintStyle: TextStyle(
                      color: const Color(0xFF878787),
                      fontSize: 12.sp,
                      fontFamily: 'TheSans',
                      fontWeight: FontWeight.w400,
                    ),
                    fillColor: const Color(0xFFF6F6F6),
                    border: InputBorder.none,
                  ),
                ),
                const VerticalSpacing(height: 10),
                Text(
                  'تعليق',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.appPrimaryColor),
                ),
                const VerticalSpacing(height: 6),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: commentTextEditingController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'ادخل تعليقك عن الخدمات المقدمة من قبلنا',
                    hintStyle: TextStyle(
                      color: const Color(0xFF878787),
                      fontSize: 12.sp,
                      fontFamily: 'TheSans',
                      fontWeight: FontWeight.w400,
                    ),
                    fillColor: const Color(0xFFF6F6F6),
                    border: InputBorder.none,
                  ),
                ),
                const VerticalSpacing(height: 50),
                SizedBox(
                  width: context.width,
                  height: context.height * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      userFormController.sendData(
                          nameTextEditingController.text,
                          certificateTextEditingController.text,
                          workTextEditingController.text,
                          commentTextEditingController.text);
                    },
                    child: const Text(
                      'ارسال',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
