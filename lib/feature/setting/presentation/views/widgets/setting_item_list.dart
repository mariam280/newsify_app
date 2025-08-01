import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsify/feature/auth/data/auth_state.dart';
import 'package:newsify/feature/setting/data/models/setting_model.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/setting_item.dart';
import 'package:provider/provider.dart';

class SettingItemList extends StatelessWidget {
  SettingItemList({super.key});
  final List<SettingModel> settingItemModel = [
    SettingModel(
      title: 'Account',
      leftIcon: Icons.person,
      rightIcon: Icons.arrow_forward_ios,
      routePage: '/accountView',
    ),
    SettingModel(
      title: 'Terms & Conditions',
      leftIcon: Icons.help_outline,
      rightIcon: Icons.arrow_forward_ios,
      routePage: '/TermsConditionView',
    ),
    SettingModel(
      title: 'About',
      leftIcon: Icons.help_outline,
      rightIcon: Icons.arrow_forward_ios,
      routePage: '/aboutView',
    ),
    SettingModel(
      title: 'Log Out',
      leftIcon: Icons.logout,
      routePage: '/login',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SettingItem(
          onTap: () async {
            if (index == 3) {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
               await Provider.of<AuthState>(context, listen: false).logout();
              GoRouter.of(context).go('/login');
            }
          },
          settingModel: settingItemModel[index],
        );
      },
      itemCount: settingItemModel.length,
      shrinkWrap: true,
    );
  }
}
