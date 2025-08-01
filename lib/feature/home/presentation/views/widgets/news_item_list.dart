import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/bookmark/presentation/manager/add_remove_news_item_cubit/add_remove_news_item_cubit.dart';
import 'package:newsify/feature/home/presentation/manager/home_news_cubit/news_cubit.dart';
import 'package:newsify/feature/home/presentation/manager/home_news_cubit/news_state.dart';
import 'package:newsify/feature/home/presentation/views/widgets/news_item.dart';

class NewsItmeList extends StatelessWidget {
  const NewsItmeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddRemoveNewsItemCubit, AddRemoveNewsItemState>(
        listener: (context, state) {
      if (state is AddNewsItemLoading) {
        Center(child: CircularProgressIndicator(color: Colors.black));
      } else if (state is AddNewsItemSuccess) {
        showSnackBar(context, 'Item saved successfully!');
      } else if (state is RemoveNewsItemSuccess) {
        showSnackBar(context, 'Item removed successfully!');
      } else if (state is AddNewsItemFailure) {
        showSnackBar(context, 'Failed to save item!');
      }
    }, builder: (context, state) {
      return BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          } else if (state is NewsSuccessState) {
            var newsItemModel = state.news;
            return SliverList.builder(
              itemBuilder: (context, index) {
                return NewsItem(
                  newsItemModel: newsItemModel[index],
                );
              },
              itemCount: newsItemModel.length,
            );
          } else if (state is NewsFailierState) {
            return SliverToBoxAdapter(
              child: Text('Error Occured${state.errMessage}'),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('No Data'),
              ),
            );
          }
        },
      );
    });
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/bookmark/presentation/manager/add_news_item_cubit/add_news_item_cubit.dart';
import 'package:newsify/feature/home/presentation/manager/home_news_cubit/news_cubit.dart';
import 'package:newsify/feature/home/presentation/manager/home_news_cubit/news_state.dart';
import 'package:newsify/feature/home/presentation/views/widgets/news_item.dart';

class NewsItmeList extends StatelessWidget {
  const NewsItmeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewsItemCubit, AddNewsItemState>(
        listener: (context, state) {
      if (state is AddNewsItemLoading) {
        Center(child: CircularProgressIndicator(color: Colors.black));
      } else if (state is AddNewsItemSuccess) {
        showSnackBar(context, 'Item saved successfully!');
      } else if (state is RemoveNewsItemSuccess) {
        showSnackBar(context, 'Item removed successfully!');
      } else if (state is AddNewsItemFailure) {
        showSnackBar(context, 'Failed to save item!');
      }
    }, builder: (context, state) {
      return BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          } else if (state is NewsSuccessState) {
            var newsItemModel = state.news;
            return SliverList.builder(
              itemBuilder: (context, index) {
                return NewsItem(
                  newsItemModel: newsItemModel[index],
                );
              },
              itemCount: newsItemModel.length,
            );
          } else if (state is NewsFailierState) {
            return SliverToBoxAdapter(
              child: Text('Error Occured${state.errMessage}'),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('No Data'),
              ),
            );
          }
        },
      );
    });
  }
}


 */
