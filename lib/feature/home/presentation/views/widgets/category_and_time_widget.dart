import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
import 'package:newsify/feature/home/presentation/views/widgets/pop_menu_Saved_button.dart';

class CategoryAndTimeWidget extends StatelessWidget {
  const CategoryAndTimeWidget({super.key, required this.newsItemModel});

  final NewsItemModel newsItemModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                newsItemModel.categoryName,
                style: AppStyles.styleBold14(context).copyWith(
                  color: Color(0xff69BDFD),
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Container(
              width: 6,
              height: 6,
              decoration: ShapeDecoration(
                color: const Color(0xFF909090),
                shape: OvalBorder(),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              DateFormat('yyyy-MM-dd').format(
                  DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(
                      newsItemModel.publishedAt ?? DateTime.now().toString())),
              style: AppStyles.styleMedium13(context).copyWith(
                fontWeight: FontWeight.w700,
                color: Color(0xFF909090),
              ),
            ),
          ],
        ),
        PopMenuSavedButton(
          newsItemModel: newsItemModel,
        ),
      ],
    );
  }
}
