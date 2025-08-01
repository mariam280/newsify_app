import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsify/core/errors/failures.dart';
import 'package:newsify/core/utils/api_service.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';

import 'package:newsify/feature/search/data/repo/search_repo/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;
  SearchRepoImpl(this.apiService);
  @override
  
  @override
  Future<Either<Failure, List<NewsItemModel>>> fetchSearchNews({required String query}) async{
    try {
      var data = await apiService.get(
          endPoint:
              'everything?q=$query');
      List<NewsItemModel> searchNews = [];
      for (var article in data['articles']) {
        searchNews.add(NewsItemModel.fromJson(article, 'general'));
      }
      return right(searchNews);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioException(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }
}