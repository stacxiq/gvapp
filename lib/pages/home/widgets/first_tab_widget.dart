import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/init_controller.dart';
import 'package:greenvilllage/core/url_launcher.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:greenvilllage/models/project.dart';
import 'package:greenvilllage/pages/home/show_feature.dart';
import 'package:greenvilllage/pages/home/widgets/company_card_widget.dart';
import 'package:greenvilllage/pages/home/widgets/header_text_widget.dart';
import 'package:greenvilllage/pages/home/widgets/home_banner_widget.dart';
import 'package:greenvilllage/pages/home/widgets/project_card.dart';
import 'package:greenvilllage/pages/home/widgets/social_container_widget.dart';
import 'package:greenvilllage/pages/imagePrevew/image_preview_screen.dart';
import 'package:greenvilllage/pages/userform/user_form_screen.dart';

class FirstTabWidget extends StatelessWidget {
  const FirstTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    InitController initController = Get.put(InitController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpacing(height: 15),
        const HomeBannerWidget(),
        const VerticalSpacing(height: 15),
        Obx(
          () => Visibility(
            visible: initController.settings
                    .firstWhereOrNull(
                        (element) => element.key == 'apple_feature')
                    ?.value ==
                'on',
            child: GestureDetector(
              onTap: () {
                Get.to(() => UserFormScreen());
              },
              child: Container(
                height: 80.h,
                width: context.width,
                decoration: BoxDecoration(
                  color: const Color(0xffF2F2F2),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Center(
                    child: Text(
                  'قم بملء ال استبيان لتطوير خدماتنا',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff4A4A4A),
                  ),
                )),
              ),
            ),
          ),
        ),
        const VerticalSpacing(height: 15),
        SizedBox(
          height: 269.h,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const FeatureScreen(
                        title: 'رؤيتنا',
                        description:
                            'صياغة مستقبل من الحياة الملهمة حيث يتلاقى الاتصال والاستدامة والمجتمع في مدينتنا السكنية النابضة بالحياة.',
                        image: 'assets/images/5.jpg'));
                  },
                  child: const CompanyCardWidget(
                    imgSrc: 'assets/images/5.jpg',
                    title: 'رؤيتنا',
                    desc:
                        'صياغة مستقبل من الحياة الملهمة حيث يتلاقى الاتصال والاستدامة والمجتمع في مدينتنا السكنية النابضة بالحياة.',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(
                      const FeatureScreen(
                          title: 'الجودة',
                          description:
                              'جميع الخدمات مشيدة بأحدث الطرق المتبعة عالميًا وبمواد ذات جودة عالية وبخبرات دولية ومحلية.',
                          image: 'assets/images/6.jpg'),
                    );
                  },
                  child: const CompanyCardWidget(
                    imgSrc: 'assets/images/6.jpg',
                    title: 'الجودة',
                    desc:
                        'جميع الخدمات مشيدة بأحدث الطرق المتبعة عالميًا وبمواد ذات جودة عالية وبخبرات دولية ومحلية.',
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalSpacing(height: 15),
        const HeaderTextWidget(
          text: 'يتضمن المشروع',
        ),
        const VerticalSpacing(height: 15),
        SizedBox(
          height: 160.h,
          child: ListView.builder(
            itemCount: projectData.length,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(ImagePreview(image: projectData[index].image));
                },
                child: ProjectCard(
                  imgSrc: 'assets/images/${projectData[index].image}',
                  title: projectData[index].title,
                ),
              );
            },
          ),
        ),
        const VerticalSpacing(height: 10),
        // const HeaderTextWidget(
        //   text: 'تواصل معنا',
        // ),
        // const VerticalSpacing(height: 8),
        // Row(
        //   children: [
        //     SocialContainerWidget(
        //       assetName: 'assets/svg/instagram.svg',
        //       pressed: () {
        //         UrlLancherUtil.launchURL(
        //             'https://www.instagram.com/greenvillage.iq/');
        //       },
        //     ),
        //     SocialContainerWidget(
        //       assetName: 'assets/svg/whatsapp.svg',
        //       pressed: () {
        //         UrlLancherUtil.launchURL('https://wa.me/+9647725467765');
        //       },
        //     ),
        //     SocialContainerWidget(
        //       assetName: 'assets/svg/web.svg',
        //       pressed: () {
        //         UrlLancherUtil.launchURL('https://gviraq.com/');
        //       },
        //     ),
        //     SocialContainerWidget(
        //       assetName: 'assets/svg/maintenance.svg',
        //       pressed: () {
        //         UrlLancherUtil.launchURL('https://gviraq.com/الحجز');
        //       },
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
