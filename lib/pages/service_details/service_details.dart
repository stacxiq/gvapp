import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/constants/functions.dart';

import 'package:greenvilllage/models/service.dart';

class ServiceDetails extends StatelessWidget {
  final ServiceModel service;
  const ServiceDetails({
    Key? key,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الخدمات'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: service.title,
                  child: SizedBox(
                    height: context.height * 0.3,
                    width: context.width,
                    child: CachedNetworkImage(
                      imageUrl: getImage(service.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(context.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.title,
                        style: context.textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(context.height * 0.01),
                      Text(
                        service.content,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  getDesc(String title) {
    switch (title) {
      case "THE 200 M2 HOUSES":
        return '''
إجمالي مساحة البناء: 215.5 متر مربع
طابقین: صالة مع 4 غرف

الطابق الأرضي:

الكراج + الممشى: 43 متر مربع
الحدیقة: 20 متر مربع
صالة: 19.6 متر مربع
غرفة المعیشة: 24.3 متر مربع
المطبخ: 8.9 متر مربع
غرفة النوم الماستر: 18.4 متر مربع

الطابق الأول:
غرفة نوم: 18 متر مربع
غرفة نوم ماستر: 19.6 متر مربع
الشرفة: 9.87 متر مربع
''';

      case 'THE 240 M2 HOUSES':
        return '''
إجمالي مساحة البناء :244 متر مربع
طابقین: صالة مع 4 غرف

الطابق الأرضي:

الكراج + الممشى: 80 متر مربع
الحدیقة: 16 متر مربع
صالة: 22.5 متر مربع
غرفة المعیشة : 29.3 متر مربع
المطبخ: 9.45 متر مربع
غرفة النوم الماستر 15.75 متر مربع

الطابق الأول:
غرفة نوم: 15.75 متر مربع
غرفة نوم ماستر: 22.5 متر مربع
غرفة نوم: 20.46 متر مربع
الشرفة: 10.34 متر مربع
''';

      default:
        return '''
إجمالي مساحة البناء :300 متر مربع
طابقین: صالة مع 4 غرف

الطابق الأرضي:
الكراج + الممشى: 109 متر مربع
الحدیقة: 23 متر مربع
الصالة: 33 متر مربع
غرفة المعیشة : 35.42 متر مربع
المطبخ: 13.34 متر مربع
غرفة النوم الماستر 19.2 متر مربع

الطابق الأول:
غرفة نوم: 19.2 متر مربع
غرفة نوم ماستر: 20 متر مربع
غرفة نوم: 25.3 متر مربع
الشرفة: 21.46 متر مربع
''';
    }
  }

  getTitle(String title) {
    switch (title) {
      case "THE 200 M2 HOUSES":
        return 'منازل نوع 200 متر مربع';

      case 'THE 240 M2 HOUSES':
        return 'منازل نوع 240 متر مربع';

      default:
        return 'منازل نوع 300 متر مربع';
    }
  }
}
