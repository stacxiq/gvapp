import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:greenvilllage/global/widgets/spacing_widgets.dart';

class HouseCard extends StatelessWidget {
  const HouseCard({
    Key? key,
    required this.imageSrc,
    required this.title,
    required this.tap,
  }) : super(key: key);
  final String imageSrc;
  final String title;
  final VoidCallback tap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        width: 327.w,
        height: 206.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.31),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 153.h,
              width: context.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.r),
                child: Image.asset(
                  imageSrc,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const VerticalSpacing(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
