import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/setting_views_header.dart';

class ChangePasswordHeader extends StatelessWidget {
  const ChangePasswordHeader({
    super.key, this.onTap,
  });
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SettingViewsHeader(title: 'Account',onTap: (){
            GoRouter.of(context).go('/accountView');
          },),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(onPressed: onTap, 
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
             child:  Text('SAVE',style: AppStyles.styleBold18(context),),
            ),
          )
        ],
      ),
    );
  }
}



