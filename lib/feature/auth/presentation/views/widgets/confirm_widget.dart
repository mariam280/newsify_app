import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_styles.dart';

class ConfirmWidget extends StatelessWidget {
  const ConfirmWidget({
    super.key,
    required this.textQuestion,
    required this.textAnswer, this.onTap,
  });
  final String textQuestion, textAnswer;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textQuestion,
          style: TextStyle(),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textAnswer,
            style: AppStyles.styleBold14(context),
          ),
        ),
      ],
    );
  }
}
