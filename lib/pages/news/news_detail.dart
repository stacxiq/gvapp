import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/constants/functions.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:greenvilllage/models/news.dart';

class NewsDetailPage extends StatelessWidget {
  NewsDetailPage({super.key, required this.hotelData});

  final News hotelData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: context.height * 0.4,
                      width: context.width,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: CachedNetworkImage(
                              imageUrl: getImage(hotelData.image))),
                    ),
                    Container(
                      height: context.height * 0.35,
                      width: context.width,
                      decoration: const BoxDecoration(
                        color: Color(
                          0x822E2E2E,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20.h,
                      left: 12.w,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color:
                                Colors.white.withOpacity(0.38999998569488525),
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
                    hotelData.title,
                    style: TextStyle(
                      color: Color(0xFF007366),
                      fontSize: 16.sp,
                      fontFamily: 'TheSans',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    hotelData.content == ''
                        ? 'Ut ex cillum do nostrud ex exercitation. Sint aliqua reprehenderit quis magna minim velit ex. Cupidatat aliquip amet amet enim ullamco minim aute velit excepteur enim voluptate. Tempor et cillum nostrud excepteur consectetur sint id ex sunt amet.'
                        : hotelData.content,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: const Color(0xFF323232),
                      fontSize: 14.sp,
                      fontFamily: 'TheSans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
