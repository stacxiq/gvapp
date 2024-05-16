import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class GreenViliage extends StatelessWidget {
  const GreenViliage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'گرين ڤلج',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.height * 0.3,
              width: context.width,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: context.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'مجمع سكني بنظام فیلا وبناء ھیكلي یتمیز بموقعه الاستراتیجي الكائن في (الأنبار -الرمادي - خلف جامعة الأنبار) یتضمن المشروع 514 وحدة سكنیة بمساحات مختلفة وخدمات متنوعة منها المشاریع الخدمیة والتجاریة التي تلبي جمیع احتیاجات الساكنين، استخدمت أجود المواد وأحدث الطرق العالمیة لتشیید المجمع بخبرات دولیة ومحلیة كبیرة من قبل المختصین في مجال التطویر العقاري. \nعلمآ أن المساحة الإجمالیة للمشروع 273392 متر مربع ومساحة البناء 115040 متر مربع',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    color: Color(0xffF5BB2E),
                    height: context.height * 0.025,
                    width: context.width * 0.02,
                  ),
                  Gap(context.width * 0.015),
                  Text(
                    'أنواع الوحدات السكنیة من حیث العدد والمساحة',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColor,
                    ),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' 1 -  300 متر مربع - 310 وحدة سكنیة .',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' 2 -  240 متر مربع - 136 وحدة سكنیة .',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' 3 -  200 متر مربع - 68 وحدة سكنیة .',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    color: Color(0xffF5BB2E),
                    height: context.height * 0.025,
                    width: context.width * 0.02,
                  ),
                  Gap(context.width * 0.015),
                  Text(
                    'یتضمن المشروع',
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.theme.primaryColor,
                    ),
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' 1 -  مناطق استراحة.',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' 2 -  مطاعم وكافیھات',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' 3 - محلات تجاریة',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '  4 - مساحات خضراء',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '  5 - مسجد',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '  6 - مدرسة',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '  7 - اماكن مخصصة للأطفال',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
                textDirection: TextDirection.rtl,
              ),
            ),
            Gap(context.height * 0.02),
          ],
        ),
      ),
    );
  }
}
