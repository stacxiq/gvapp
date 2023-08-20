import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:greenvilllage/pages/login/login.dart';
import 'package:greenvilllage/pages/register/register.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الإعدادات"),
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              // _SingleSection(
              //   title: "المستخدم",
              //   children: [
              //     _CustomListTile(
              //       title: "تسجيل",
              //       icon: CupertinoIcons.person_3,
              //       onTap: () {
              //         Get.to(() => RegisterPage());
              //       },
              //     ),
              //     _CustomListTile(
              //       title: "تسجيل دخول",
              //       icon: CupertinoIcons.person,
              //       onTap: () {
              //         Get.to(() => LoginPage());
              //       },
              //     ),
              //   ],
              // ),
              _SingleSection(
                title: "عام",
                children: [
                  const _CustomListTile(
                      title: "عن التطبيق",
                      icon: CupertinoIcons.device_phone_portrait),
                  _CustomListTile(
                      title: "وضع الداكن",
                      icon: CupertinoIcons.moon,
                      trailing:
                          CupertinoSwitch(value: false, onChanged: (value) {})),
                  const _CustomListTile(
                      title: "مشاركة التطبيق", icon: CupertinoIcons.share),
                  const _CustomListTile(
                      title: "سياسة الخصوصية",
                      icon: CupertinoIcons.lock_shield),
                ],
              ),
            ],
          ),
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
          color: Colors.white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
