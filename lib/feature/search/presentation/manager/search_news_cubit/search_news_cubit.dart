import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:newsify/core/errors/failures.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
import 'package:newsify/feature/search/data/repo/search_repo/search_repo.dart';

part 'search_news_state.dart';

class SearchNewsCubit extends Cubit<SearchNewsState> {
  SearchNewsCubit(this.searchRepo) : super(SearchNewsInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchNews({required String query}) async {
     
    emit(SearchNewsLoading());
    Either<Failure, List<NewsItemModel>> result = await searchRepo.fetchSearchNews(
      query: query,
    );
    result.fold((failure) {
      emit(SearchNewsFailure(failure.errorMessage));
    }, (news) {
      emit(SearchNewsSuccess(news));
    });
  }
}
