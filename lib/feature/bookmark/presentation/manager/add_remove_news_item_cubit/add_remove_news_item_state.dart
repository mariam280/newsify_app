part of 'add_remove_news_item_cubit.dart';

@immutable
sealed class AddRemoveNewsItemState {}

final class AddNewsItemInitial extends AddRemoveNewsItemState {}

final class AddNewsItemLoading extends AddRemoveNewsItemState {}

final class AddNewsItemSuccess extends AddRemoveNewsItemState {
  final bool isSaved;
  final NewsItemModel item;
  AddNewsItemSuccess({required this.item, required this.isSaved});
}

final class RemoveNewsItemSuccess extends AddRemoveNewsItemState {
  final bool isSaved;
  RemoveNewsItemSuccess({required this.isSaved});
}

class AddNewsItemCheckState extends AddRemoveNewsItemState {
  final bool isSaved;
  AddNewsItemCheckState({required this.isSaved});
}

final class AddNewsItemFailure extends AddRemoveNewsItemState {
  final String errorMessage;

  AddNewsItemFailure(this.errorMessage);
}
