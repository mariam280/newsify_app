import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsify/core/errors/failures.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
import 'package:newsify/feature/home/data/repos/home_repo/home_repo.dart';
import 'package:newsify/feature/home/presentation/manager/home_news_cubit/news_state.dart';


class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.homeRepo) : super(NewsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchCategoryNews({required String category}) async {
     
    emit(NewsLoadingState());
    Either<Failure, List<NewsItemModel>> result = await homeRepo.fetchcategoryNews(category: category);
    result.fold((failure) {
      emit(NewsFailierState(failure.errorMessage));
    }, (news) {
      emit(NewsSuccessState(news));
    });
  }
}
