import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';

class CompanyCardWidget extends StatelessWidget {
  const CompanyCardWidget(
      {super.key,
      required this.imgSrc,
      required this.title,
      required this.desc});

  final String imgSrc;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 234.w,
      height: 269.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.31),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 40,
            offset: Offset(12, 4),
            spreadRadius: 0,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      margin: EdgeInsets.only(left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpacing(height: 5),
          SizedBox(
            height: 142.h,
            width: 220.w,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                imgSrc,
              ),
            ),
          ),
          const VerticalSpacing(height: 5),
          Text(
            title,
            maxLines: 1,
            style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.appPrimaryColor,
                fontWeight: FontWeight.w700),
          ),
          const VerticalSpacing(height: 5),
          Text(
            desc,
            maxLines: 2,
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 11.sp,
                color: const Color(0xff454545),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
