import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/utils/service_locator.dart';
import 'package:newsify/feature/bookmark/data/repos/bookmark_repo_impl.dart';
import 'package:newsify/feature/bookmark/presentation/manager/add_remove_news_item_cubit/add_remove_news_item_cubit.dart';
import 'package:newsify/feature/bookmark/presentation/views/widgets/book_mark_button.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';

class DetailsViewHeader extends StatelessWidget {
  const DetailsViewHeader({
    super.key,
    required this.newsItemModel,
  });
  final NewsItemModel newsItemModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context).go('/pageView');
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined)),
            Row(
              children: [
                BlocProvider.value(
                  value: AddRemoveNewsItemCubit.AddRemoveNewsItemCubit(
                      getIt.get<BookmarkRepoImpl>()),
                  child: BookMarkButton(newsItemModel: newsItemModel),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
