import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_images.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
import 'package:newsify/feature/home/presentation/views/widgets/details_section_body.dart';
import 'package:newsify/feature/home/presentation/views/widgets/details_view_header.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.newsItemModel});
  final NewsItemModel newsItemModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetailsViewHeader(
            newsItemModel: newsItemModel,
          ),
          SizedBox(
            width: double.infinity,
            child: AspectRatio(
              aspectRatio: 390 / 229,
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: newsItemModel.imageUrl ?? '',
                  fit: BoxFit.fill,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  )),
                  errorWidget: (context, url, error) => Image.asset(
                    Assets.imagesImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          DetailsSectionBody(
            newsItemModel: newsItemModel,
          ),
        ],
      ),
    );
  }
}
