import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/widgets/spacing_widgets.dart';
import 'package:greenvilllage/pages/home/widgets/house_card.dart';
import 'package:greenvilllage/pages/house/house_1.dart';
import 'package:greenvilllage/pages/house/house_2.dart';
import 'package:greenvilllage/pages/house/house_3.dart';

class SecondTabWidget extends StatelessWidget {
  const SecondTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSpacing(height: 15),
        HouseCard(
          imageSrc: 'assets/images/project_img01.jpg',
          title: 'منازل نوع 200 متر مربع',
          tap: () {
            Get.to(() => const HouseOneScreen());
          },
        ),
        const VerticalSpacing(height: 10),
        HouseCard(
          imageSrc: 'assets/images/project_img03.jpg',
          title: 'منازل نوع 240 متر مربع',
          tap: () {
            Get.to(() => const HouseTwoScreen());
          },
        ),
        const VerticalSpacing(height: 10),
        HouseCard(
          imageSrc: 'assets/images/project_img02.jpg',
          title: 'منازل نوع 300 متر مربع',
          tap: () {
            Get.to(() => const HouseThreeScreen());
          },
        ),
      ],
    );
  }
}
