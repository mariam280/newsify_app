import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_images.dart';

class HeaderLoginViews extends StatelessWidget {
  const HeaderLoginViews({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
        ),
        SizedBox(
            width: 100, height: 110, child: Image.asset(Assets.imagesLogo)),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
