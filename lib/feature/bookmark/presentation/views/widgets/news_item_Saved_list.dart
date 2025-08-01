import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/bookmark/presentation/manager/add_remove_news_item_cubit/add_remove_news_item_cubit.dart';
import 'package:newsify/feature/bookmark/presentation/manager/display_news_item_cubit/display_news_item_cubit.dart';
import 'package:newsify/feature/home/presentation/views/widgets/news_item.dart';

class NewsItmeSavedList extends StatelessWidget {
  const NewsItmeSavedList({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddRemoveNewsItemCubit, AddRemoveNewsItemState>(
      listener: (context, state) {
        if (state is AddNewsItemLoading) {
          Center(child: CircularProgressIndicator(color: Colors.black));
        } else if (state is RemoveNewsItemSuccess) {
          BlocProvider.of<DisplayNewsItemCubit>(context)
              .displayNewsItem(category: category);
          showSnackBar(context, 'Item removed successfully!');
        } else if (state is AddNewsItemFailure) {
          showSnackBar(context, 'Failed to save item!');
        }
      },
      builder: (context, state) {
        return BlocBuilder<DisplayNewsItemCubit, DisplayNewsItemState>(
          builder: (context, state) {
            if (state is DisplayNewsItemLoading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              );
            } else if (state is DisplayNewsItemSuccess) {
              var newsItemModel = state.newsItemModel;
              return SliverList.builder(
                itemBuilder: (context, index) {
                  return NewsItem(
                    newsItemModel: newsItemModel[index],
                  );
                },
                itemCount: newsItemModel.length,
              );
            } else if (state is DisplayNewsItemFailure) {
              return SliverToBoxAdapter(
                child: Text(state.errorMessage),
              );
            } else {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('No Data saved yet!'),
                ),
              );
            }
          },
        );
      },
    );
  }
}