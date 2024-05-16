import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:greenvilllage/pages/imagePrevew/image_preview_screen.dart';
import '../../core/extensions.dart';

class HouseThreeScreen extends StatelessWidget {
  const HouseThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 300.h,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset(
                        'project_img02.jpg'.imagePath(),
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
              const VerticalSpacing(height: 10),
              Center(
                child: Text(
                  'منازل نوع 300 متر مربع',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.appPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpacing(height: 15),
                    Text.rich(
                      TextSpan(
                        text: 'إجمالي مساحة البناء: ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.appPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: '300 متر مربع',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'طابقين: صالة مع 4 غرف',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const VerticalSpacing(height: 5),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'الطابق الأرضي:\n',
                            style: TextStyle(
                              color: Color(0xFF25897B),
                              fontSize: 16,
                              fontFamily: 'TheSans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' الكراج + الممشى: 109 متر مربع\n الحديقة: 23 متر مربع\n صالة: 33 متر مربع\n غرفة المعيشة :  35.42 متر مربع\n المطبخ: 13.34 متر مربع\n غرفة النوم الماستر 19.2 متر مربع',
                            style: TextStyle(
                              color: Color(0xFF323232),
                              fontSize: 16,
                              fontFamily: 'TheSans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const VerticalSpacing(height: 5),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'الطابق الأول:',
                            style: TextStyle(
                              color: Color(0xFF25897B),
                              fontSize: 16,
                              fontFamily: 'TheSans',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: ' \n',
                            style: TextStyle(
                              color: Color(0xFF25897B),
                              fontSize: 16,
                              fontFamily: 'TheSans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text:
                                'غرفة نوم: 19.2 متر مربع\nغرفة نوم ماستر: 20 متر مربع \nغرفة نوم: 25.3 متر مربع\nالشرفة: 21.46 متر مربع',
                            style: TextStyle(
                              color: Color(0xFF323232),
                              fontSize: 16,
                              fontFamily: 'TheSans',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                            () => const ImagePreview(image: '300-ground.jpg'));
                      },
                      child: SizedBox(
                        height: 200.h,
                        width: context.width,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(
                            '300-ground.jpg'.imagePath(),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'الطابق الارضي',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                            () => const ImagePreview(image: '300-floor.jpg'));
                      },
                      child: SizedBox(
                        height: 200.h,
                        width: context.width,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(
                            '300-floor.jpg'.imagePath(),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'الطابق الاول',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const VerticalSpacing(height: 25),
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
