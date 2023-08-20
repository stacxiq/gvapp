import 'package:flutter/material.dart';
import 'package:greenvilllage/global/widgets/welcome_slide.dart';

class PageViewBuilder extends StatelessWidget {
  const PageViewBuilder({
    required this.currentColor,
    required this.controller,
    super.key,
  });

  final Color currentColor;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: const [
        WelcomeSlide(
          path: 'assets/images/logo.png',
        ),
        WelcomeSlide(
          path: 'assets/images/0M0A0175.jpg',
        ),
        WelcomeSlide(
          path: 'assets/images/0M0A0205.jpg',
        ),
      ],
    );
  }
}
