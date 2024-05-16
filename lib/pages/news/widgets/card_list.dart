import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/constants/functions.dart';
import 'package:greenvilllage/global/constants/style.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:greenvilllage/models/news.dart';
import 'package:greenvilllage/pages/news/news_detail.dart';
import 'package:greenvilllage/repositories/news_repository.dart';

class CardList extends StatelessWidget {
  final News hotelData;

  const CardList(this.hotelData, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      child: GestureDetector(
        onTap: () async {
          final res = await newsRepository.increaseNewsViews(hotelData.id);

          res.fold((l) {}, (r) {
            print(r.data);
          });
          Get.to(() => NewsDetailPage(hotelData: hotelData));
        },
        child: Container(
          width: double.infinity,
          height: 350.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0.r)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    blurRadius: 3.0,
                    spreadRadius: 1.0)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 181.h,
                width: context.width,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ),
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CachedNetworkImage(
                      imageUrl: getImage(hotelData.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const VerticalSpacing(height: 10),
                    Text(
                      hotelData.title,
                      style: TextStyle(
                        color: AppColors.appPrimaryColor,
                        fontSize: 16.sp,
                        fontFamily: 'TheSans',
                        fontWeight: FontWeight.w700,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      hotelData.content == ''
                          ? 'لمراحل النهائية تعتمد على دقة المراحل الاساسية'
                          : hotelData.content,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// الاسئلة الشائعة 
// TODO: الاسئللة الشائعة