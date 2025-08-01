import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/app_images.dart';
import 'package:newsify/feature/auth/presentation/views/widgets/confirm_widget.dart';
import 'package:newsify/feature/auth/presentation/views/widgets/sign_in_icons_list.dart';

class SectionFooterLogin extends StatelessWidget {
  const SectionFooterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Image.asset(Assets.imagesSignInWith),
        const SizedBox(
          height: 40,
        ),
        SignInIconsList(),
        const SizedBox(
          height: 50,
        ),
        ConfirmWidget(
          textQuestion: 'dont\'t have an account?',
          textAnswer: '  Register',
          onTap: () {
            GoRouter.of(context).go('/registreView');
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
