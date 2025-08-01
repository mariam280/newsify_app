import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsify/feature/bookmark/data/repos/bookmark_repo.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
part 'display_news_item_state.dart';

class DisplayNewsItemCubit extends Cubit<DisplayNewsItemState> {
  final BookmarkRepo bookmarkRepo;
  bool isSaved = false;
  DisplayNewsItemCubit(this.bookmarkRepo) : super(DisplayNewsItemInitial());
 Future<void> displayNewsItem({required String category}) async {
    emit(DisplayNewsItemLoading());
    final result = await bookmarkRepo.displayNewsItem(category);
    result.fold(
      (failure) {
        emit(DisplayNewsItemFailure(failure.toString()));
      },
      (newsList) {
        emit(DisplayNewsItemSuccess(newsList));
      },
    );
  }
}