import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/helper/constants.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/account_item_list.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/setting_views_header.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryolor,
      body: Column(
        children: [
          SafeArea(
            child: SettingViewsHeader(
              title: 'Account',
              onTap: () {
                GoRouter.of(context).go('/pageView');
              },
            ),
          ),
          AccountItemList(),
        ],
      ),
    );
  }
}

