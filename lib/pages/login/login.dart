import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/login_controller.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/widgets/logo_widget.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:greenvilllage/models/login_request.dart';

class LoginPage extends StatelessWidget {
  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  LoginController loginController = Get.put(LoginController());
  LoginPage({super.key});
  late AppLifecycleListener appLifecycleListener;

  @override
  Widget build(BuildContext context) {
    appLifecycleListener = AppLifecycleListener(
      onPause: () {
        print('App is in background');
      },
    );

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
                    'تسجيل دخول',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appPrimaryColor,
                    ),
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
                  controller: phoneEditingController,
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
                  controller: passwordEditingController,
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
                      loginController.login(
                        LoginRequest(
                          phone: phoneEditingController.text,
                          password: passwordEditingController.text,
                        ),
                      );
                    },
                    child: const Text(
                      'تسجيل دخول',
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
