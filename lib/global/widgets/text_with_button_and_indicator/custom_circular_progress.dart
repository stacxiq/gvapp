import 'package:flutter/material.dart';
import 'package:greenvilllage/global/constants/animations.dart';
import 'package:greenvilllage/global/constants/functions.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 70,
      child: TweenAnimationBuilder<double>(
        tween: getProgressOnCurrentIndex(currentIndex),
        duration: AppAnimations.circularProgressIndicator,
        builder: (_, value, __) => CircularProgressIndicator(
          backgroundColor: Colors.grey.withOpacity(0.2),
          value: value,
          strokeWidth: 1,
          valueColor: AlwaysStoppedAnimation(
            getColorFromIndex(currentIndex),
          ),
        ),
      ),
    );
  }
}
