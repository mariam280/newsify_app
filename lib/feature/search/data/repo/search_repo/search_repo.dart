import 'package:dartz/dartz.dart';
import 'package:newsify/core/errors/failures.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<NewsItemModel>>> fetchSearchNews({required String query});
}