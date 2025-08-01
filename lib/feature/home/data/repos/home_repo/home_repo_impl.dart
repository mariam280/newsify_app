import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:newsify/core/errors/failures.dart';
import 'package:newsify/core/utils/api_service.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';
import 'package:newsify/feature/home/data/repos/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<NewsItemModel>>> fetchcategoryNews({required String category}) async{
     try {
      var data = await apiService.get(
          endPoint:
              'top-headlines?country=us&category=$category');
      List<NewsItemModel> news = [];
      for (var article in data['articles']) {
        news.add(NewsItemModel.fromJson(article, category));
      }
      return right(news);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailer.fromDioException(e));
      }
      return left(ServerFailer(e.toString()));
    }
  }
}