import 'package:newsify/feature/home/data/models/news_item_model.dart';

final class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoadingState extends NewsState {}

final class NewsSuccessState extends NewsState {
  List<NewsItemModel> news;

  NewsSuccessState(this.news);
}

final class NewsFailierState extends NewsState {
   String errMessage;

  NewsFailierState(this.errMessage);
}
