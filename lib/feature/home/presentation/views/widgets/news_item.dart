import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
import 'package:newsify/feature/home/presentation/views/widgets/news_details.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.newsItemModel});
  final NewsItemModel newsItemModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       GoRouter.of(context).go('/detailsView', extra: newsItemModel);
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.509,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
             NewsDetails(
              newsItemModel: newsItemModel,
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Color(0xFFEEEEEE),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
