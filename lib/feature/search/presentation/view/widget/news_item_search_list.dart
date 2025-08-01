import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/bookmark/presentation/manager/add_remove_news_item_cubit/add_remove_news_item_cubit.dart';
import 'package:newsify/feature/search/presentation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:newsify/feature/search/presentation/view/widget/news_items_search.dart';

class NewsItmeSearchList extends StatelessWidget {
  const NewsItmeSearchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddRemoveNewsItemCubit, AddRemoveNewsItemState>(
        listener: (context, state) {
      if (state is AddNewsItemLoading) {
        CircularProgressIndicator(color: Colors.black);
      } else if (state is AddNewsItemSuccess) {
        showSnackBar(context, 'Item saved successfully!');
      } else if (state is RemoveNewsItemSuccess) {
        showSnackBar(context, 'Item removed successfully!');
      } else if (state is AddNewsItemFailure) {
        showSnackBar(
            context, 'Item already saved!'); 
      }
    }, builder: (context, state) {
      return BlocBuilder<SearchNewsCubit, SearchNewsState>(
        builder: (context, state) {
          if (state is SearchNewsLoading) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              ),
            );
          } else if (state is SearchNewsSuccess) {
            var newsItemModel = state.searchnewsList;
            return SliverList.builder(
              itemBuilder: (context, index) {
                return NewsItemsSearch(
                  newsItemModel: newsItemModel[index],
                );
              },
              itemCount: newsItemModel.length,
            );
          } else if (state is SearchNewsFailure) {
            return SliverToBoxAdapter(
              child: Text('Error Occured${state.errorMessage}'),
            );
          } else {
            return const SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, 
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('No Data Found'),
                ],
              ),
            );
          }
        },
      );
    });
  }
}