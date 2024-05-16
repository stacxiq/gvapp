import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:greenvilllage/global/constants/app_colors.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color: AppColors.appPrimaryColor,
      ),
    );
  }
}
