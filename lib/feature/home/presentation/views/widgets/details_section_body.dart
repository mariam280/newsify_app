import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
import 'package:newsify/feature/home/presentation/views/widgets/auther_image_widget.dart';

class DetailsSectionBody extends StatelessWidget {
  const DetailsSectionBody({super.key, required this.newsItemModel});
final NewsItemModel newsItemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text( newsItemModel.title ?? 'there is no title',
          style: AppStyles.styleBold18(context).copyWith(
            height: 1.43,
            letterSpacing: -0.17,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        AutherImageWidget(
          autherName: newsItemModel.authorName ?? 'unKnown',
          time: DateFormat('yyyy-MM-dd').format(
                             DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(newsItemModel.publishedAt ?? DateTime.now().toString()),
                ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text( newsItemModel.description ?? 'there is no description',
        style: AppStyles.styleRegular15(context).copyWith(
           height: 1.67,
           letterSpacing: -0.17,
        ),),
        const SizedBox(
          height: 20,
        ),
        Text( newsItemModel.content ?? 'there is no content',
        style: AppStyles.styleRegular15(context).copyWith(
           height: 1.67,
           letterSpacing: -0.17,
        ),)
        ],
      ),
    );
  }
}