import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialContainerWidget extends StatelessWidget {
  final String assetName;
  final VoidCallback pressed;
  const SocialContainerWidget({super.key, required this.assetName, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        width: 39.74.w,
        height: 35.67.h,
        margin: EdgeInsets.only(left: 14.w),
        decoration: ShapeDecoration(
          color: const Color(0xFFFDFDFD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.13),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 20.38,
              offset: Offset(0, 2.04),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: SvgPicture.asset(assetName),
        ),
      ),
    );
  }
}
