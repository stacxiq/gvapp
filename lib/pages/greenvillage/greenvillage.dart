import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GreenViliage extends StatelessWidget {
  const GreenViliage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'گرين فيلج',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                'Occaecat nostrud enim in irure id elit ullamco aliquip et exercitation exercitation ullamco. Eiusmod exercitation ipsum velit officia do. Sit sint ad ullamco do laboris nisi commodo esse anim excepteur mollit. Consectetur ad magna sint nisi nostrud. Elit minim reprehenderit exercitation eiusmod excepteur mollit deserunt sit commodo Lorem aliquip id. Minim exercitation nulla veniam veniam. Nisi excepteur velit aliquip velit voluptate commodo minim aute veniam sunt officia reprehenderit. Culpa mollit incididunt sit incididunt minim mollit esse cupidatat cillum exercitation adipisicing tempor id reprehenderit. Dolore irure laboris ex minim ipsum ad irure in do ex sint. Officia ea incididunt in excepteur.',
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.theme.primaryColor,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
