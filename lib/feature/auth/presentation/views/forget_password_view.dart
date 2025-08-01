import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/helper/constants.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/core/utils/widgets/custom_TextField.dart';
import 'package:newsify/core/utils/widgets/custom_button.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/auth/presentation/manager/forget_password_cubit/forgetpassword_cubit.dart';

class ForgetPasswordView extends StatefulWidget {
 const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetpassWordCubit, ForgetpasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          showSnackBar(context, 'Reset link sent to your email');
          GoRouter.of(context).go('/login');
        } else if (state is ForgetPasswordFailure) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: kPrimaryolor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: kPrimaryolor,
                leading: IconButton(
                    onPressed: () {
                      GoRouter.of(context).go('/login');
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 18,
                    )),
                title: Text(
                  'Forgot Password',
                  style: AppStyles.styleBold18(context),
                ),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomFormTextField(
                    onChanged: (data) {
                      email = data;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'field is required';
                      }
                      if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    labelText: 'Email',
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomButon(
                    text: state is ForgetPasswordLoading
                        ? 'Sending...'
                        : 'Reset Password',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<ForgetpassWordCubit>(context)
                            .forgetPassword(email: email!);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
