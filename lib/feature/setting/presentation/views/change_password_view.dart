import 'package:flutter/material.dart';
import 'package:newsify/core/helper/constants.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryolor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ChangePasswordViewBody(),
      ),
    );
  }
}


