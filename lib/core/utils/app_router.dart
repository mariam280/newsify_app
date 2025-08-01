import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/service_locator.dart';
import 'package:newsify/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:newsify/feature/auth/presentation/manager/forget_password_cubit/forgetpassword_cubit.dart';
import 'package:newsify/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:newsify/feature/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:newsify/feature/home/presentation/views/details_view.dart';
import 'package:newsify/feature/home/presentation/views/main_layout.dart';
import 'package:newsify/feature/auth/data/auth_state.dart';
import 'package:newsify/feature/auth/presentation/views/forget_password_view.dart';
import 'package:newsify/feature/auth/presentation/views/login_page.dart';
import 'package:newsify/feature/auth/presentation/views/registre_page.dart';
import 'package:newsify/feature/setting/data/repos/change_password_repo_impl.dart';
import 'package:newsify/feature/setting/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:newsify/feature/setting/presentation/views/about_view.dart';
import 'package:newsify/feature/setting/presentation/views/account_view.dart';
import 'package:newsify/feature/setting/presentation/views/change_password_view.dart';
import 'package:newsify/feature/setting/presentation/views/notifications_view.dart';
import 'package:newsify/feature/setting/presentation/views/terms_condition_view.dart';
import 'package:provider/provider.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    redirect: (context, state) async {
      await Provider.of<AuthState>(context, listen: false).loadLoginState();
      final auth = Provider.of<AuthState>(context, listen: false);
      final isAuthRoute = _isAuthRoute(state.matchedLocation);
      if (auth.isLoggedIn && isAuthRoute) {
        return '/pageView';
      }
      if (!auth.isLoggedIn && !isAuthRoute) {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
          child: LoginView(),
        ),
      ),
      GoRoute(
        path: '/registreView',
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>()),
          child: RegistreView(),
        ),
      ),
      GoRoute(
        path: '/pageView',
        builder: (context, state) => MainLayout(),
      ),
      GoRoute(
        path: '/detailsView',
        builder: (context, state) => DetailsView(),
      ),
      GoRoute(
        path: '/TermsConditionView',
        builder: (context, state) => TermsConditionView(),
      ),
      GoRoute(
        path: '/aboutView',
        builder: (context, state) => AboutView(),
      ),
      GoRoute(
        path: '/accountView',
        builder: (context, state) => AccountView(),
      ),
      GoRoute(
        path: '/changePasswordView',
        builder: (context, state) => BlocProvider(
          create: (context) => ChangePasswordCubit(ChangePasswordRepoImpl()),
          child: ChangePasswordView(),
        ),
      ),
      GoRoute(
        path: '/notificationsView',
        builder: (context, state) => NotificationsView(),
      ),
      GoRoute(
        path: '/forgetPasswordView',
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetpassWordCubit(getIt.get<AuthRepoImpl>()),
          child: ForgetPasswordView(),
        ),
      ),
    ],
  );

  static bool _isAuthRoute(String location) {
    return [
      '/login',
      '/registreView',
      '/resetPasswordView',
      '/forgetPasswordView',
    ].contains(location);
  }
}
