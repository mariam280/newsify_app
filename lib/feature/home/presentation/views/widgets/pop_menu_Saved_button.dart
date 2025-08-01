import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/utils/functions/show_snackBar.dart';
import 'package:newsify/feature/bookmark/presentation/manager/add_remove_news_item_cubit/add_remove_news_item_cubit.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';

class PopMenuSavedButton extends StatefulWidget {
  const PopMenuSavedButton({super.key, required this.newsItemModel});
  final NewsItemModel newsItemModel;

  @override
  State<PopMenuSavedButton> createState() => _PopMenuSavedButtonState();
}

class _PopMenuSavedButtonState extends State<PopMenuSavedButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert, color: Colors.black),
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: (value) async {
        if (value == 'bookmark') {
          BlocProvider.of<AddRemoveNewsItemCubit>(context)
              .addNewsItem(widget.newsItemModel);
        } else if (value == 'remove') {
          setState(() {
            BlocProvider.of<AddRemoveNewsItemCubit>(context)
                .removeNewsItem(widget.newsItemModel.id!);
            showSnackBar(context, 'Item removed successfully!');
          });
        } else {
          // Share.share;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'bookmark',
          child: Row(
            children: [
              Icon(Icons.bookmark_border, size: 18, color: Colors.black),
              SizedBox(width: 10),
              Text(
                'Bookmarked',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'remove',
          child: Row(
            children: [
              Icon(Icons.bookmark, size: 18, color: Colors.black),
              SizedBox(width: 10),
              Text(
                'removed',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'share',
          child: Row(
            children: [
              Icon(Icons.share, size: 18, color: Colors.black),
              SizedBox(width: 10),
              Text(
                'share',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
