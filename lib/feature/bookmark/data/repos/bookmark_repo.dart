import 'package:dartz/dartz.dart';
import 'package:newsify/core/errors/store_failuer.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';

abstract class BookmarkRepo {
  Future<Either<StoreFailure, NewsItemModel>> addNewsItem(NewsItemModel newsItemModel);
  Future<Either<StoreFailure, List<NewsItemModel>>> displayNewsItem(String category);
  Future<Either<StoreFailure, void>> removeNewsItem(String newsId);
  Future<Either<StoreFailure, bool>> checkIfNewsItemSaved(String title);
}
