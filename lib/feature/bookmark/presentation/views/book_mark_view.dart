import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/feature/bookmark/presentation/manager/display_news_item_cubit/display_news_item_cubit.dart';
import 'package:newsify/feature/bookmark/presentation/views/widgets/category_item_saved_list.dart';
import 'package:newsify/feature/bookmark/presentation/views/widgets/news_item_Saved_list.dart';

class BookMarkView extends StatefulWidget {
  const BookMarkView({super.key});

  @override
  State<BookMarkView> createState() => _BookMarkViewState();
}

class _BookMarkViewState extends State<BookMarkView> {
  String selectedCategory = 'general';

   @override
  void initState() {
    super.initState();
    // إضافة addPostFrameCallback لتأجيل التحديث بعد البناء
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DisplayNewsItemCubit>(context)
          .displayNewsItem(category: selectedCategory);
    });
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 16),
                       child: Text(
                        'Bookmarked',
                        style: AppStyles.styleBold14(context).copyWith(
                          fontSize: 16,
                        ),
                      ),
                     ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CategoryItemSavedList(
                 onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                   BlocProvider.of<DisplayNewsItemCubit>(context)
                      .displayNewsItem(category: category);
                },
              ),
            ),
            NewsItmeSavedList(category: selectedCategory,),
          ],
        ),
      ),
    );
  }
}