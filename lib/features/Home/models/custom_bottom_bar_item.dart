import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';

class CustomBottomBarItem {
  final Widget icon;

  final Widget? activeIcon;

  final Widget title;

  final Color? selectedColor;

  final Color? unselectedColor;

  CustomBottomBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });

  static List<CustomBottomBarItem> bottomNavItems = [
    CustomBottomBarItem(
      icon: SvgPicture.asset(AppSvg.home),
      title: const Text(
        "Home",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tajawal',
        ),
      ),
    ),

    CustomBottomBarItem(
      icon: SvgPicture.asset(AppSvg.explore),
      title: const Text(
        "Discover",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tajawal',
        ),
      ),
    ),

    CustomBottomBarItem(
      icon: SvgPicture.asset(AppSvg.save),
      title: const Text(
        "Saved",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tajawal',
        ),
      ),
    ),

    CustomBottomBarItem(
      icon: SvgPicture.asset(AppSvg.profile),
      title: const Text(
        "Profile",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tajawal',
        ),
      ),
    ),
  ];
}
