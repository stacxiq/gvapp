import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/pages/login/login.dart';
import 'package:iconsax/iconsax.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("تسجيل"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Gap(context.height * 0.02),
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
                    hintText: 'رقم الهاتف',
                    prefixIcon: Icon(
                      Iconsax.call,
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
                  onPressed: () {},
                  child: const Text(
                    'تسجيل ',
                  ),
                ),
              ),
              Gap(context.height * 0.02),
              RichText(
                text: TextSpan(
                  style: theme.textTheme.labelMedium,
                  children: [
                    const TextSpan(
                      text: 'لديك حساب ؟',
                    ),
                    TextSpan(
                      text: ' تسجيل دخول ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => LoginPage());
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
