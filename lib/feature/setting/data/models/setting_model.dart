import 'package:flutter/material.dart';

class SettingModel {
  final String title;
  final IconData leftIcon;
  final IconData? rightIcon;
  final bool? isSwitch;
  final String routePage;

  SettingModel({
   required this.title,
   required this.leftIcon,
    this.rightIcon,
   this.isSwitch, 
   required this.routePage,});
}
