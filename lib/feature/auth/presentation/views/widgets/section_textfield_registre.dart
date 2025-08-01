import 'package:flutter/material.dart';
import 'package:newsify/core/utils/widgets/custom_TextField.dart';

class SectionTextfieldRegistre extends StatelessWidget {
  const SectionTextfieldRegistre(
      {super.key,
      required this.onEmailChanged,
      required this.onPasswordChanged,
      required this.isPasswordVisible,
      required this.onTogglePasswordVisibility});
  final void Function(String) onEmailChanged;
  final void Function(String) onPasswordChanged;
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
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
