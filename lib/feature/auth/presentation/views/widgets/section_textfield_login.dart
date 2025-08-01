import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/core/utils/widgets/custom_TextField.dart';

class SectionTextfieldLogin extends StatelessWidget {
  const SectionTextfieldLogin(
      {super.key,
      required this.onEmailChanged,
      required this.onPasswordChanged,
      this.suffixIcon,
      required this.isPasswordVisible,
      required this.onTogglePasswordVisibility});
  final void Function(String) onEmailChanged;
  final void Function(String) onPasswordChanged;
  final IconData? suffixIcon;
  final bool isPasswordVisible;
  final VoidCallback onTogglePasswordVisibility;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormTextField(
          onChanged: onEmailChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'field is required';
            }
            if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          hintText: 'Email',
          labelText: 'Email',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomFormTextField(
          obscureText: !isPasswordVisible,
          onChanged: onPasswordChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'field is required';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              size: 18,
            ),
            onPressed: onTogglePasswordVisibility,
          ),
          hintText: 'Password',
          labelText: 'Password',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context).go('/forgetPasswordView');
              },
              child: Text(
                ' Forget Password?',
                style: AppStyles.styleBold14(context),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}