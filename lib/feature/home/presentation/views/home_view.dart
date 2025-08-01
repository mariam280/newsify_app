import 'package:flutter/material.dart';
import 'package:newsify/feature/home/presentation/views/widgets/home_view_header.dart';
import 'package:newsify/feature/home/presentation/views/widgets/category_item_list.dart';
import 'package:newsify/feature/home/presentation/views/widgets/news_item_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

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
              child: HomeViewHeader(),
            ),
            SliverToBoxAdapter(
              child: CategoryItemList(),
            ),
            NewsItmeList(),
          ],
        ),
      ),
    );
  }
}
