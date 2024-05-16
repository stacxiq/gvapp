import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/controllers/settings_controller.dart';
import 'package:greenvilllage/global/constants/constants.dart';
import 'package:greenvilllage/pages/login/login.dart';
import 'package:greenvilllage/pages/profile/profile.dart';
import 'package:greenvilllage/pages/register/register.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  Box tokenBox = Get.find<Box>(tag: TOKEN);
  SettingsXController settingsController = Get.put(SettingsXController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: tokenBox.get(TOKEN, defaultValue: null) == null
              ? ListView(
                  children: [
                    _SingleSection(title: "المستخدم", children: [
                      _CustomListTile(
                        title: "تسجيل",
                        icon: CupertinoIcons.person_3,
                        onTap: () {
                          Get.to(() => RegisterPage());
                        },
                      ),
                      _CustomListTile(
                        title: "تسجيل دخول",
                        icon: CupertinoIcons.person,
                        onTap: () {
                          Get.to(() => LoginPage());
                        },
                      ),
                    ]),
                  ],
                )
              : ProfileScreen(),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;
  const _CustomListTile(
      {Key? key,
      required this.title,
      required this.icon,
      this.trailing,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing ?? const Icon(CupertinoIcons.forward, size: 18),
      onTap: onTap ?? () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style:
                Theme.of(context).textTheme.headline3?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
