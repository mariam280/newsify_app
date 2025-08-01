import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:newsify/core/helper/constants.dart';
import 'package:newsify/core/utils/widgets/custom_button.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/auth/presentation/views/widgets/section_footer_register.dart';
import 'package:newsify/feature/auth/presentation/views/widgets/section_textfield_registre.dart';
import 'package:newsify/feature/home/presentation/manager/home_news_cubit/news_cubit.dart';
import 'package:newsify/feature/auth/data/auth_state.dart';
import 'package:newsify/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:newsify/feature/auth/presentation/views/widgets/header_login_views.dart';
import 'package:provider/provider.dart';

class RegistreView extends StatefulWidget {
  const RegistreView({super.key});

  @override
  State<RegistreView> createState() => _RegistreViewState();
}

class _RegistreViewState extends State<RegistreView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  bool isLoading = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          isLoading = true;
        } else if (state is RegisterSuccessState) {
          isLoading = false;
          showSnackBar(context,
              'go to your $email and enter on link to verefiy your email');
          // BlocProvider.of<NewsCubit>(context)
          //     .fetchCategoryNews(category: 'general');
          //   GoRouter.of(context).go('/pageView');
          isLoading = false;
        } else if (state is RegisterSuccessGoogleState) {
          isLoading = false;
          BlocProvider.of<NewsCubit>(context)
              .fetchCategoryNews(category: 'general');
           GoRouter.of(context).go('/pageView');
        } else if (state is RegisterFaluireState) {
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
                autovalidateMode: autovalidateMode,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderLoginViews(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                     SectionTextfieldRegistre(
                      isPasswordVisible: isPasswordVisible,
                      onTogglePasswordVisibility: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      onEmailChanged:(value){
                        email = value;
                      } , 
                      onPasswordChanged:(value){
                        password = value;
                      } ),
                      CustomButon(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            await Provider.of<AuthState>(context,
                                    listen: false)
                                .login();
                            BlocProvider.of<RegisterCubit>(context)
                                .signUpWithEmail(
                                    email: email!, password: password!);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                          }
                        },
                        text: 'Sign UP',
                      ),
                      SectionFooterRegister(),
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
