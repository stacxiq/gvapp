import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key, required this.title, required this.image});
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الخدمات'),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: title,
                  child: SizedBox(
                    height: context.height * 0.3,
                    width: context.width,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Gap(context.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(context.height * 0.01),
                      const Text(
                        'Reprehenderit nisi anim minim ullamco nulla ipsum. In et tempor tempor ipsum id do culpa veniam reprehenderit et quis. Adipisicing consectetur et amet in velit enim sunt adipisicing aliqua nulla nostrud commodo mollit. Eu eu aute amet culpa eiusmod laboris eu fugiat enim voluptate et exercitation ullamco eiusmod. Magna ad excepteur deserunt mollit culpa irure Lorem qui ullamco esse qui nulla proident commodo. Et aute fugiat non excepteur est. Mollit ut in sit eu. Enim aute pariatur ex elit non et est aute aliquip aliquip laboris do qui. Consequat officia proident ex laboris ullamco sint ad. Fugiat nisi in aute pariatur cillum reprehenderit nulla ullamco do non pariatur exercitation elit. Nostrud ea exercitation velit adipisicing est laborum quis ea nisi dolor esse incididunt labore. Adipisicing id eu ipsum nulla laborum adipisicing eu ad incididunt consectetur quis sunt. Ut commodo dolore aliqua ipsum aliquip laboris eu ipsum ad laborum aliqua amet.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
