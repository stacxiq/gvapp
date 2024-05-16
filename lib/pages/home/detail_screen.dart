import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: context.height,
            child: Image.asset(
              'assets/images/home-banner.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(
                0x822E2E2E,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: context.height * 0.35,
              width: context.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(29.r),
                    topRight: Radius.circular(29.r),
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpacing(height: 42),
                    Text(
                      'مجمع سكني بنظام فيلا وبناء هيكلي ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.appPrimaryColor,
                      ),
                    ),
                    const VerticalSpacing(height: 4),
                    Text(
                      'يتميز بموقعه الاستراتيجي الكائن في الأنبار - الرمادي - خلف جامعة الأنبار يتضمن 514 وحدة سكنية بمساحات مختلفة وخدمات متنوعة من المشاريع الخدمية والتجارية التي تلبي جميع احتياجات سكان المجمع.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: const Color(0xFF454545),
                        fontSize: 12.sp,
                        fontFamily: 'TheSans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 60.h,
            left: 12.w,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.38999998569488525),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
