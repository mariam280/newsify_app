import 'package:flutter/material.dart';
import 'package:newsify/core/utils/widgets/custom_TextField.dart';

class ChangePasswordBodyTextfield extends StatelessWidget {
  const ChangePasswordBodyTextfield({super.key, this.currentPasswordOnchanged, this.newPasswordOnchanged, this.confirmPasswordOnchanged, required this.isPasswordVisible, required this.onTogglePasswordVisibility});
  final dynamic Function(String)? currentPasswordOnchanged;
  final dynamic Function(String)? newPasswordOnchanged;
  final dynamic Function(String)? confirmPasswordOnchanged;
  final bool isPasswordVisible;
  final VoidCallback onTogglePasswordVisibility;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomFormTextField(
          hintText: 'Current Password',
          obscureText: !isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              size: 18,
            ),
            onPressed: onTogglePasswordVisibility,
          ),
          onChanged:currentPasswordOnchanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your current password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
        ),
        CustomFormTextField(
          hintText: 'New Password',
          obscureText: !isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              size: 18,
            ),
            onPressed: onTogglePasswordVisibility,
          ),
          onChanged: newPasswordOnchanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your new password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            }
            return null;
          },
        ),
        CustomFormTextField(
          hintText: 'Confirm Password',
          obscureText: !isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              size: 18,
            ),
            onPressed: onTogglePasswordVisibility,
          ),
          onChanged: confirmPasswordOnchanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your new password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            } 
            return null;
          },
        ),
      ],
    );
  }
}
