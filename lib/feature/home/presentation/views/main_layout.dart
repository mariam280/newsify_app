import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/helper/constants.dart';
import 'package:newsify/core/utils/api_service.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/core/utils/service_locator.dart';
import 'package:newsify/feature/bookmark/data/repos/bookmark_repo_impl.dart';
import 'package:newsify/feature/bookmark/presentation/manager/add_remove_news_item_cubit/add_remove_news_item_cubit.dart';
import 'package:newsify/feature/bookmark/presentation/manager/display_news_item_cubit/display_news_item_cubit.dart';
import 'package:newsify/feature/bookmark/presentation/views/book_mark_view.dart';
import 'package:newsify/feature/search/data/repo/search_repo/search_repo_impl.dart';
import 'package:newsify/feature/search/presentation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:newsify/feature/home/presentation/views/widgets/custom_nav_bar.dart';
import 'package:newsify/feature/home/presentation/views/home_view.dart';
import 'package:newsify/feature/search/presentation/view/search_view.dart';
import 'package:newsify/feature/setting/presentation/views/setting_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  PageController pageController = PageController();
  int currentIndex = 0;
  DateTime? lastPressed;
  void onTap(int index) {
    if (currentIndex != index) {
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      currentIndex = index;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        final now = DateTime.now();
        final maxDuration = Duration(seconds: 2);

        if (lastPressed == null || now.difference(lastPressed!) > maxDuration) {
          lastPressed = now;
          showSnackBar(context, 'Press back again to exit');
          result = false;
        } else {
          result = true;
          SystemNavigator.pop();
        }
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                SearchNewsCubit(SearchRepoImpl(getIt.get<ApiService>())),
          ),
          BlocProvider(
            create: (context) => AddRemoveNewsItemCubit.AddRemoveNewsItemCubit(
                getIt.get<BookmarkRepoImpl>()),
          ),
          BlocProvider(
            create: (context) =>
                DisplayNewsItemCubit(getIt.get<BookmarkRepoImpl>()),
          ),
        ],
        child: Scaffold(
          backgroundColor: kPrimaryolor,
          body: Stack(
            children: [
              ExpandablePageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    HomeView(),
                    SearchView(),
                    BookMarkView(),
                    SettingView(),
                  ]),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: CustomNavBar(onTap: onTap, currentIndex: currentIndex))
            ],
          ),
        ),
      ),
    );
  }
}
