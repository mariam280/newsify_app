import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/api_service.dart';
import 'package:newsify/core/utils/app_router.dart';
import 'package:newsify/core/utils/service_locator.dart';
import 'package:newsify/feature/auth/data/auth_state.dart';
import 'package:newsify/feature/home/data/repos/home_repo/home_repo_impl.dart';
import 'package:newsify/feature/home/presentation/manager/home_news_cubit/news_cubit.dart';
import 'package:newsify/feature/setting/data/flutter_local_notification_.dart';
import 'package:newsify/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  final authState = AuthState();
  await authState.loadLoginState();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  await Workmanager().registerPeriodicTask(
    "1",
    "checkNews",
    frequency: Duration(minutes: 20),
  );
  runApp(ChangeNotifierProvider(
      create: (context) => authState, child: const NewsifyApp()));
}

class NewsifyApp extends StatelessWidget {
  const NewsifyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsCubit(HomeRepoImpl(getIt.get<ApiService>()))
            ..fetchCategoryNews(category: 'general',),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
