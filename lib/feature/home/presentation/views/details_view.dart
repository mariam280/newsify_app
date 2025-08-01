import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/helper/constants.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
import 'package:newsify/feature/home/presentation/views/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, });
  @override
  Widget build(BuildContext context) {
     final newsItemModel = GoRouterState.of(context).extra as NewsItemModel;
    return Scaffold(
      backgroundColor: kPrimaryolor,
      body: DetailsViewBody(newsItemModel: newsItemModel,),
    );
  }
}


