import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/register_controller.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/widgets/logo_widget.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:greenvilllage/models/register_request.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  RegisterController controller = Get.put(RegisterController());
  // text fields
  final nameFieldController = TextEditingController();
  final phoneFieldController = TextEditingController();
  final addressFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
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
                    'إنشاء حساب',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appPrimaryColor,
                    ),
                  ),
                ),
                const VerticalSpacing(height: 20),
                Text(
                  'الإسم الكامل',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.appPrimaryColor),
                ),
                const VerticalSpacing(height: 6),
                TextFormField(
                  controller: nameFieldController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'ادخل إسمك الكامل',
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
                  'رقم الهاتف',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.appPrimaryColor),
                ),
                const VerticalSpacing(height: 6),
                TextFormField(
                  controller: phoneFieldController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'ادخل رقم الهاتف الخاص بك',
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
                  'كلمة المرور',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.appPrimaryColor),
                ),
                const VerticalSpacing(height: 6),
                TextFormField(
                  controller: passwordFieldController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'ادخل كلمة المرور',
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
                      controller.register(
                        RegisterRequest(
                          phone: phoneFieldController.text,
                          password: passwordFieldController.text,
                          name: nameFieldController.text,
                          address: addressFieldController.text,
                        ),
                      );
                    },
                    child: const Text(
                      'تسجيل',
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
