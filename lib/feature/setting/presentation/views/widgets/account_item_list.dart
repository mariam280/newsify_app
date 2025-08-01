import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsify/feature/setting/data/models/setting_model.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/setting_item.dart';

class AccountItemList extends StatefulWidget {
  const AccountItemList({super.key});

  @override
  State<AccountItemList> createState() => _AccountItemListState();
}

class _AccountItemListState extends State<AccountItemList> {
  String?email;
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
       setState(() {
      email = user?.email ?? 'No Email';
    }); 
  }

 
  @override
  Widget build(BuildContext context) {
     final List<SettingModel> settingItemModel = [
    SettingModel(
      title: email ?? '',
      leftIcon: Icons.email,
      routePage: '',
    ),
    SettingModel(
      title: 'Change Password',
      leftIcon: Icons.lock_outline,
      rightIcon: Icons.arrow_forward_ios,
      routePage: '/changePasswordView',
    ),
  ];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SettingItem(
          settingModel: settingItemModel[index],
        );
      },
      itemCount: settingItemModel.length,
      shrinkWrap: true,
    );
  }
}
