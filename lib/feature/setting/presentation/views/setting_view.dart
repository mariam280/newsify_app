import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/feature/setting/data/notiification_view_model.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/setting_item.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/setting_item_list.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final viewModel = NotificationViewModel();
 bool notificationsEnabled = true;

 @override
void initState() {
  super.initState();
  loadSwitchStatus();
}

Future<void> loadSwitchStatus() async {
  final enabled = await viewModel.isNotificationsEnabled();
  setState(() {
    notificationsEnabled = enabled;
  });
}


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height ,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            SafeArea(child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Settings',style: AppStyles.styleBold14(context).copyWith(
                fontSize: 20,
              ),),
            )),
          ],),
          NotificatonSettingItem(
            value: notificationsEnabled,
            onChanged: (value) async {
              setState(() {
                notificationsEnabled = value;
              });
              await viewModel.saveNotificationsEnabled(value);
            },
          ),
          SettingItemList(),
        ],
      ),
    );
  }
}
