import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/feature/setting/data/models/setting_model.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({super.key, required this.settingModel, this.onTap});
  final SettingModel settingModel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        settingModel.title,
        style: AppStyles.styleBold14(context).copyWith(
          fontSize: 16,
        ),
      ),
      leading: Icon(settingModel.leftIcon),
      trailing: IconButton(
        onPressed: () {
          GoRouter.of(context).go(settingModel.routePage);
        },
        icon: Icon(
          settingModel.rightIcon,
          size: 18,
        ),
      ),
      onTap: onTap,
    );
  }
}

class NotificatonSettingItem extends StatelessWidget {
  const NotificatonSettingItem({super.key, required this.value, this.onChanged});
  final bool value;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Push Notifications',
        style: AppStyles.styleBold14(context).copyWith(
          fontSize: 16,
        ),
      ),
      leading: Icon(Icons.notifications_outlined),
      trailing: Transform.scale(
        scale: 0.7,
        child: Switch(
            value: value,
            activeTrackColor: Colors.black,
            onChanged:  onChanged),
      ),
    );
  }
}
