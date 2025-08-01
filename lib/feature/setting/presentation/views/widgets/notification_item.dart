import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_images.dart';
import 'package:newsify/core/utils/app_styles.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key,  this.title});
 final String? title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        child: Image.asset(Assets.imagesNewsLogo1,fit: BoxFit.fill,)),
      title: Text(title ?? 'Unknown',style: AppStyles.styleBold14(context).copyWith(
        fontSize: 16,
      ),),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text('general' ,
        style: AppStyles.styleBold14(context).copyWith(color: Colors.grey),),
      ),
    );
  }
}
