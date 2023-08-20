import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/pages/tabs/tabs.dart';

Color getColorFromIndex(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return Colors.yellowAccent;
    case 1:
      return Colors.green;
    case 2:
      return Color(0xff28635F);
    default:
      return Colors.red;
  }
}

String getCurrentTitle(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return 'گرين فيلج';
    case 1:
      return 'گرين فيلج';
    case 2:
      return 'گرين فيلج';
    default:
      return '';
  }
}

String getCurrentSubtext(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return 'حياة تليق بك';
    case 1:
      return 'تقدم لك خدمات تليق بك';
    case 2:
      return 'احجز شقتك الان وتمتع ب افضال الخدمات';
    default:
      return '';
  }
}

void navigateToNextPage(
  int currentIndex,
  PageController controller,
) =>
    currentIndex != 2
        ? controller.nextPage(
            duration: const Duration(milliseconds: 1500),
            curve: Curves.elasticOut,
          )
        : Get.offAll(TabsScreen());

Tween<double> getProgressOnCurrentIndex(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return Tween<double>(
        begin: 0,
        end: 0.5,
      );
    case 1:
      return Tween<double>(
        begin: 0.5,
        end: 0.75,
      );
    case 2:
      return Tween<double>(
        begin: 0.75,
        end: 1,
      );
    default:
      return Tween<double>(
        begin: 0,
        end: 0.5,
      );
  }
}

Icon getProperIcon(int currentIndex) => currentIndex != 2
    ? const Icon(
        Icons.navigate_next,
        key: ValueKey('next_icon'),
        color: Colors.white,
      )
    : const Icon(
        Icons.done,
        key: ValueKey('done_icon'),
        color: Colors.white,
      );

void navigationViaButton(
  int currentIndex,
  PageController controller,
) =>
    currentIndex != 2
        ? controller.nextPage(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeOutCirc,
          )
        : controller.animateToPage(
            0,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeOutExpo,
          );
