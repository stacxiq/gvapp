import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 197.w,
      height: 40.h,
      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.appPrimaryColor,
        ),
        indicatorColor: Colors.transparent,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: AppColors.appPrimaryColor,
        tabs: const [
          Tab(
            text: 'معلومات عنا',
          ),
          Tab(
            text: 'المنازل',
          ),
        ],
      ),
    );
  }
}
