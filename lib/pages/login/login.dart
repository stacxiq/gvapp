import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/pages/register/register.dart';
import 'package:greenvilllage/pages/tabs/tabs.dart';
import 'package:iconsax/iconsax.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("تسجيل الدخول"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Gap(context.height * 0.04),
              SizedBox(
                height: context.height * 0.34,
                width: context.width,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              Gap(context.height * 0.01),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'اسم المستخدم',
                    prefixIcon: Icon(
                      Iconsax.user,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Gap(context.height * 0.02),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'كلمة المرور',
                    prefixIcon: Icon(
                      Iconsax.password_check,
                      size: 18,
                    ),
                  ),
                ),
              ),
              Gap(context.height * 0.02),
              SizedBox(
                width: context.width,
                height: context.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => const TabsScreen());
                  },
                  child: const Text(
                    'تسجيل الدخول',
                  ),
                ),
              ),
              Gap(context.height * 0.02),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.labelMedium,
                  children: [
                    const TextSpan(
                      text: 'ليس لديك حساب ؟',
                    ),
                    TextSpan(
                      text: ' أنشاء حساب',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const RegisterPage());
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
