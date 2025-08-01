import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:newsify/core/helper/constants.dart';
import 'package:newsify/core/utils/widgets/custom_button.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/auth/presentation/views/widgets/section_footer_login.dart';
import 'package:newsify/feature/auth/presentation/views/widgets/section_textfield_login.dart';
import 'package:newsify/feature/home/presentation/manager/home_news_cubit/news_cubit.dart';
import 'package:newsify/feature/auth/data/auth_state.dart';
import 'package:newsify/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:newsify/feature/auth/presentation/views/widgets/header_login_views.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  bool isLoading = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          BlocProvider.of<NewsCubit>(context)
              .fetchCategoryNews(category: 'general');
          isLoading = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
      GoRouter.of(context).go('/pageView');
    });
        } else if (state is LoginSuccessGoogleState) {
          BlocProvider.of<NewsCubit>(context)
              .fetchCategoryNews(category: 'general');
          isLoading = false;
           WidgetsBinding.instance.addPostFrameCallback((_) {      //////////////////////method
      GoRouter.of(context).go('/pageView');
    });
        } else if (state is LoginFaluireState) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }},
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: const CircularProgressIndicator(    
            color: Colors.black,
          ),
          child: Scaffold(
            backgroundColor: kPrimaryolor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderLoginViews(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      SectionTextfieldLogin(
                        isPasswordVisible: isPasswordVisible,
                        onTogglePasswordVisibility: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        onEmailChanged: (value){
                          email = value;
                        }, 
                        onPasswordChanged: (value){
                          password = value;
                        }),
                      CustomButon(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context)
                                .signinWithEmail(
                                    email: email!, password: password!);
                            await Provider.of<AuthState>(context,
                                    listen: false)
                                .login();
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }},
                        text: 'Sign IN',
                      ),
                      SectionFooterLogin(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}