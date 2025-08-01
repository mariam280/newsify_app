import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/app_styles.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/bookmark/presentation/manager/add_remove_news_item_cubit/add_remove_news_item_cubit.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';

class BookMarkButton extends StatelessWidget {
  const BookMarkButton({
    super.key,
    required this.newsItemModel,
  });
  final NewsItemModel newsItemModel;

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
          showSnackBar(context, 'Item already saved!');
        }
      },
      builder: (context, state) {
        return TextButton(
          onPressed: () async {
            context.read<AddRemoveNewsItemCubit>().addNewsItem(newsItemModel);
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'SAVE',
            style: AppStyles.styleBold18(context),
          ),
        );
      },
    );
  }
}