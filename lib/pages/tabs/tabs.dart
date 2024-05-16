import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:greenvilllage/global/constants/app_colors.dart';
import 'package:greenvilllage/global/constants/constants.dart';
import 'package:greenvilllage/pages/home/home.dart';
import 'package:greenvilllage/pages/news/news.dart';
import 'package:greenvilllage/pages/profile/profile.dart';
import 'package:greenvilllage/pages/settings/setting.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';

//
class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  Box tokenBox = Get.find<Box>(tag: TOKEN);

  final _pages = [HomePage(), Concept9List(), SettingsPage()];
  final items = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    if (tokenBox.get(TOKEN, defaultValue: null) != null) {
      _pages.add(ProfileScreen());
      items.add(const BottomNavigationBarItem(
        icon: Icon(Iconsax.user),
        label: 'الملف الشخصي',
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
          child: Container(
            width: 327.w,
            height: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.appPrimaryColor,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/home.svg',
                    colorFilter: ColorFilter.mode(
                        _selectedIndex == 0
                            ? Colors.white
                            : const Color(0xdcdcdcc9),
                        BlendMode.srcIn),
                  ),
                  label: 'الرئيسية',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/book.svg',
                    colorFilter: ColorFilter.mode(
                        _selectedIndex == 1
                            ? Colors.white
                            : const Color(0xdcdcdcc9),
                        BlendMode.srcIn),
                  ),
                  label: 'الاخبار',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/svg/user.svg',
                    colorFilter: ColorFilter.mode(
                        _selectedIndex == 2
                            ? Colors.white
                            : const Color(0xdcdcdcc9),
                        BlendMode.srcIn),
                  ),
                  label: 'الاعدادات',
                )
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
