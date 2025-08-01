import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/app_images.dart';
import 'package:newsify/feature/auth/presentation/manager/login_cubit/login_cubit.dart';

class SignInIconsList extends StatelessWidget {
  const SignInIconsList({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SignInIcon(
          onTap: onTap,
          imagePath: Assets.imagesSignInEmeilIcons,
        ),
        SignInIcon(
          onTap: () {
            BlocProvider.of<LoginCubit>(context).signInWithGoogle();
            GoRouter.of(context).go('/pageView');
          },
          imagePath: Assets.imagesSignInGoogleIcons,
        ),
        SignInIcon(
          onTap: () {},
          imagePath: Assets.imagesSignInFacebookIcons,
        ),
        SignInIcon(
          onTap: () {
            // BlocProvider.of<LoginCubit>(context).signInWithTwitter();
            //  GoRouter.of(context).go('/pageView');
          },
          imagePath: Assets.imagesSignInTwetreIcons,
        ),
        SignInIcon(
          onTap: () {},
          imagePath: Assets.imagesSignInAppleIcons,
        ),
      ],
    );
  }
}

class SignInIcon extends StatelessWidget {
  const SignInIcon({super.key, this.onTap, this.imagePath});
  final VoidCallback? onTap;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(imagePath!),
    );
  }
}
