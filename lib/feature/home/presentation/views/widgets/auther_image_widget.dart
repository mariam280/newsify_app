import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_images.dart';
import 'package:newsify/core/utils/app_styles.dart';

class AutherImageWidget extends StatelessWidget {
  const AutherImageWidget({super.key, required this.autherName, required this.time});
  final String autherName;
  final String time ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(Assets.imagesNewsAuthorImage),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              autherName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleMedium13(context).copyWith(
                color: const Color(0xFF909090),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            time,
            style: AppStyles.styleMedium13(context).copyWith(
              fontWeight: FontWeight.w700,
              color: Color(0xFF909090),
            ),
          ),
        ),
      ],
    );
  }
}
