import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/app_images.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only( right: 10,top:20 ),
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(),
              ),
            ),
            Image.asset(Assets.imagesTitleLogo),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                      onTap: () {
                        GoRouter.of(context).go('/notificationsView');
                      },
                      child: Image.asset(Assets.imagesNotification)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
