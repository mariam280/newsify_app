import 'package:flutter/material.dart';

class MainNavIcon extends StatelessWidget {
  const MainNavIcon({
    super.key,
    required this.onTap,
    required this.isSelected, required this.activeIcon, required this.inActiveIcon,
  });
  final VoidCallback onTap;
  final  String activeIcon,inActiveIcon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isSelected ? Image.asset(activeIcon):Image.asset(inActiveIcon),
    );
  }
}