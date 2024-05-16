import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/core/extensions.dart';

class ImagePreview extends StatelessWidget {
  final String image;
  const ImagePreview({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'معرض الصور',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Image.asset(
          image.imagePath(),
        ),
      ),
    );
  }
}
