import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/feature/search/presentation/manager/search_news_cubit/search_news_cubit.dart';
import 'package:newsify/feature/search/presentation/view/widget/news_item_search_list.dart';
import 'package:newsify/feature/search/presentation/view/widget/search_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(child: SearchTextField(
                onSubmitted: (value) {
                  BlocProvider.of<SearchNewsCubit>(context).fetchSearchNews(
                    query: value,
                  );
                },
              )),
            ),
            NewsItmeSearchList(),
          ],
        ),
      ),
    );
  }
}
