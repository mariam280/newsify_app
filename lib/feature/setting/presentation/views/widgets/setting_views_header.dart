import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_styles.dart';

class SettingViewsHeader extends StatelessWidget {
  const SettingViewsHeader({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon:  IconButton( onPressed: onTap,
          icon: Icon(Icons.arrow_back_ios_new_rounded,size: 18,)),
          onPressed: onTap,
        ),
        const SizedBox(width: 16),
        Text(
          title,
          style: AppStyles.styleBold18(context),
        ),
      ],
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.textBody, required this.textTitle});

  final String textBody,textTitle;
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textTitle,
          style: AppStyles.styleBold18(context),
        ),
        const SizedBox(height: 16),
        Text(textBody,style: AppStyles.styleRegular15(context),),
      ],
    );
  }
}
