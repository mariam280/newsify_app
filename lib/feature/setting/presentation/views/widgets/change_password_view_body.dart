import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/auth/data/auth_state.dart';
import 'package:newsify/feature/setting/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/change_password_body_textfield.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/change_password_header.dart';
import 'package:provider/provider.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({
    super.key,
  });

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  String? currentPassword, newPassword, confirmPassword;
  bool isPasswordVisible = false;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
              listener: (context, state) async {
                if (!context.mounted) return;
                if (state is ChangePasswordLoading) {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ChangePasswordError) {
                  showSnackBar(context, state.error);
                } else if (state is ChangePasswordSuccess) {
                  showSnackBar(context,
                      'Password changed successfully. Please log in again.');
                  await FirebaseAuth.instance.signOut();
                  await Provider.of<AuthState>(context, listen: false).logout();
                  GoRouter.of(context).go('/login');
                }
              },
              builder: (context, state) {
                return ChangePasswordHeader(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (confirmPassword != null &&
                          newPassword == confirmPassword) {
                        context.read<ChangePasswordCubit>().changePassword(
                              oldPassword: currentPassword!,
                              newPassword: newPassword!,
                            );
                      } else {
                        showSnackBar(context, 'Passwords do not match!');
                      }
                    }
                  },
                );
              },
            ),
            ChangePasswordBodyTextfield(
              isPasswordVisible: isPasswordVisible,
              onTogglePasswordVisibility: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
              currentPasswordOnchanged: (value) {
                currentPassword = value;
              },
              newPasswordOnchanged: (value) {
                newPassword = value;
              },
              confirmPasswordOnchanged: (value) {
                confirmPassword = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
