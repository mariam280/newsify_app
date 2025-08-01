import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_images.dart';
import 'package:newsify/feature/home/presentation/views/widgets/main_nav_icon.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar(
      {super.key, required this.onTap, required this.currentIndex});
  final Function(int) onTap;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 430 / 90,
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MainNavIcon(
                onTap: () => onTap(0),
               activeIcon: Assets.imagesActiveHome,
                inActiveIcon: Assets.imagesInactiveHome,
                isSelected: currentIndex == 0),
            MainNavIcon(
                onTap: () => onTap(1),
               activeIcon: Assets.imagesActiveSearch,
                inActiveIcon: Assets.imagesInactiveSearch,
                isSelected: currentIndex == 1),
            MainNavIcon(
                onTap: () => onTap(2),
                activeIcon: Assets.imagesActiveBookmark,
                inActiveIcon: Assets.imagesInactiveBookmark,
                isSelected: currentIndex == 2),
            MainNavIcon(
                onTap: () => onTap(3),
                activeIcon: Assets.imagesActiveSettings,
                inActiveIcon: Assets.imagesInactiveSettings,
                isSelected: currentIndex == 3),
          ],
        ),
      ),
    );
  }
}
