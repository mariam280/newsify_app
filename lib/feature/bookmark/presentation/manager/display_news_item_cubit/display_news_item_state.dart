part of 'display_news_item_cubit.dart';

@immutable
sealed class DisplayNewsItemState {}

final class DisplayNewsItemInitial extends DisplayNewsItemState {}
final class DisplayNewsItemLoading extends DisplayNewsItemState {}
final class DisplayNewsItemSuccess extends DisplayNewsItemState {
final  List<NewsItemModel>  newsItemModel;
  DisplayNewsItemSuccess(this.newsItemModel);
}
final class DisplayNewsItemFailure extends DisplayNewsItemState {
  final String errorMessage;

  DisplayNewsItemFailure( this.errorMessage); 
}

