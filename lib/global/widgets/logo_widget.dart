
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    Center(
              child: SizedBox(
                width: 231.w,
                height: 40.h,
                child: Image.asset(
                  'assets/images/gv-logo.png',
                ),
              ),
            );
  }
}