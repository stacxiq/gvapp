import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeSlide extends StatelessWidget {
  const WelcomeSlide({
    required this.path,
    super.key,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.8,
      height: context.height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image(
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
