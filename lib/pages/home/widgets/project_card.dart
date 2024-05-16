import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.imgSrc, required this.title});
  final String imgSrc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 203.w,
      height: 222.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFF8F8F8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.31),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 22,
            offset: Offset(3, 4),
            spreadRadius: 0,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      margin: EdgeInsets.only(left: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 115.h,
            width: context.width,
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
              color: const Color(0xAA2E2E2E),
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          const VerticalSpacing(height: 5),
        ],
      ),
    );
  }
}
