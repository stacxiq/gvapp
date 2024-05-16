
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/pages/home/detail_screen.dart';

class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {
            Get.to(() => const DetailScreen());
          },
          child: Stack(
            children: [
              SizedBox(
                height: 180.h,
                width: context.width,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    'assets/images/home-banner.png',
                  ),
                ),
              ),
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                  color: const Color(0xff2F2F2f).withOpacity(.51),
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
              Positioned(
                right: 13.w,
                bottom: 15.h,
                child: Text(
                  'مجمع سكني بنظام فيلا وبناء هيكلي يتميز\nبموقعه الاستراتيجي ....المزيد',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.28,
                  ),
                ),
              ),
            ],
          ),
        );
  }
}