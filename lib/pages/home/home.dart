import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:greenvilllage/pages/greenvillage/greenvillage.dart';
import 'package:greenvilllage/pages/service_details/service_details.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  ContainerTransitionType _transitionType = ContainerTransitionType.fadeThrough;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('الرئيسية'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.notification),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'گرين فيلج',
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
                Text(
                  'حياة تليق بك',
                  style: theme.textTheme.headlineMedium,
                ),
                Gap(context.height * 0.02),
                OpenContainer<bool>(
                  transitionType: _transitionType,
                  openBuilder: (BuildContext _, VoidCallback openContainer) {
                    return GreenViliage();
                  },
                  closedShape: const RoundedRectangleBorder(),
                  closedElevation: 0.0,
                  transitionDuration: Duration(seconds: 1),
                  closedBuilder: (BuildContext _, VoidCallback openContainer) {
                    return GestureDetector(
                      onTap: openContainer,
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(
                              width: context.width,
                              height: context.height * 0.25,
                              child: Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Gap(context.height * 0.002),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى) ويُستخدم في صناعات المطابع ودور النشر. كان لوريم إيبسوم ولايزال المعيار للنص الشكلي منذ القرن الخامس عشر عندما قامت مطبعة مجهولة برص مجموعة من الأحرف بشكل عشوائي أخذتها من نص، لتكوّن كتيّب بمثابة دليل أو مرجع شكلي لهذه الأحرف',
                                maxLines: 3,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Gap(context.height * 0.02),
                Row(
                  children: [
                    Container(
                      color: Color(0xffF5BB2E),
                      height: context.height * 0.025,
                      width: context.width * 0.02,
                    ),
                    Gap(context.width * 0.015),
                    Text('الخدمات', style: theme.textTheme.titleLarge),
                  ],
                ),
                Gap(context.height * 0.02),
                SizedBox(
                  height: context.height * 0.32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        width: context.width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ServiceDetails(
                                    title: 'THE 200 M2 HOUSES',
                                    image: 'assets/images/project_img01.jpg',
                                  ));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Hero(
                                    tag: 'THE 200 M2 HOUSES',
                                    child: Image.asset(
                                      'assets/images/project_img01.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Gap(context.height * 0.01),
                                  const Text('THE 200 M2 HOUSES')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ServiceDetails(
                                    title: 'THE 240 M2 HOUSES',
                                    image: 'assets/images/project_img02.jpg',
                                  ));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Hero(
                                    tag: 'THE 240 M2 HOUSES',
                                    child: Image.asset(
                                      'assets/images/project_img02.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Gap(context.height * 0.01),
                                  Text('THE 240 M2 HOUSES')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.8,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ServiceDetails(
                                    title: 'THE 300 M2 HOUSES',
                                    image: 'assets/images/project_img03.jpg',
                                  ));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Hero(
                                    tag: 'THE 300 M2 HOUSES',
                                    child: Image.asset(
                                      'assets/images/project_img03.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Gap(context.height * 0.01),
                                  const Text('THE 300 M2 HOUSES')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
