import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/app_images.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/feature/auth/presentation/views/widgets/sign_in_icons_list.dart';

class SectionFooterRegister extends StatelessWidget {
  const SectionFooterRegister({super.key});

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
        SignInIconsList(
          onTap: () {
            GoRouter.of(context).go('/login');
          },
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          'By signing up to News24 you are accepting our \n Terms & Conditions',
          textAlign: TextAlign.center,
          style: AppStyles.styleBold14(context),
        ),
      ],
    );
  }
}
