import 'package:flutter/material.dart';
import 'package:greenvilllage/global/constants/animations.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    required this.currentIndex,
    required this.currentColor,
  });

  final int currentIndex;
  final Color currentColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: AnimatedContainer(
            curve: Curves.ease,
            duration: AppAnimations.defaultDuration,
            width: index == currentIndex ? 30 : 10,
            height: 10,
            decoration: BoxDecoration(
              color: Color(0xff28635F),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
