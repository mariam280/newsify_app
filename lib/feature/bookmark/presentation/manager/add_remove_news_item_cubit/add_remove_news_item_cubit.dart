import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsify/feature/bookmark/data/repos/bookmark_repo.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
part 'add_remove_news_item_state.dart';

class AddRemoveNewsItemCubit extends Cubit<AddRemoveNewsItemState> {
  final BookmarkRepo bookmarkRepo;
  bool isSaved = false;
  AddRemoveNewsItemCubit.AddRemoveNewsItemCubit(this.bookmarkRepo)
      : super(AddNewsItemInitial());
  Future<void> addNewsItem(NewsItemModel newsItem) async {
    emit(AddNewsItemLoading());
    final result = await bookmarkRepo.addNewsItem(newsItem);
    result.fold(
      (failure) {
        emit(AddNewsItemFailure(failure.toString()));
      },
      (newsItem) {
        isSaved = true;
        emit(AddNewsItemSuccess(
          isSaved: isSaved,
          item: newsItem,
        ));
      },
    );
  }

  Future<void> removeNewsItem(String newsId) async {
    emit(AddNewsItemLoading());
    final result = await bookmarkRepo.removeNewsItem(newsId);
    result.fold(
      (failure) {
        emit(AddNewsItemFailure(failure.toString()));
        throw failure; //************ */
      },
      (_) {
        isSaved = false;
        emit(RemoveNewsItemSuccess(
          isSaved: isSaved,
        ));
      },
    );
  }

  Future<void> checkIfNewsItemSaved(String title) async {
    emit(AddNewsItemLoading());
    final result = await bookmarkRepo.checkIfNewsItemSaved(title);
    result.fold(
      (failure) {
        emit(AddNewsItemFailure(failure.toString()));
      },
      (isSaved) {
        this.isSaved = isSaved;
        emit(AddNewsItemCheckState(isSaved: this.isSaved));
        return;
      },
    );
  }
}