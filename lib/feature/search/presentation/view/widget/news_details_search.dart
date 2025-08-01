import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_images.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';

class NewsDetailsSearch extends StatelessWidget {
  const NewsDetailsSearch({super.key, required this.newsItemModel});
  final NewsItemModel newsItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.365,
          child: AspectRatio(
            aspectRatio: 137 / 142,
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: newsItemModel.imageUrl ?? '',
                fit: BoxFit.fill,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Image.asset(
                  Assets.imagesImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                newsItemModel.title ?? 'Unknown',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleBold14(context).copyWith(
                  height: 1.43,
                  letterSpacing: -0.17,
                  fontSize: 16,
                ),
              ),
              Text(
                'By ${newsItemModel.authorName ?? 'Unknown'}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.styleMedium13(context).copyWith(
                  color: const Color(0xFF909090),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
