import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:newsify/core/errors/store_failuer.dart';
import 'package:newsify/feature/bookmark/data/repos/bookmark_repo.dart';
import 'package:newsify/feature/home/data/models/news_item_model.dart';

class BookmarkRepoImpl implements BookmarkRepo {
  @override
  Future<Either<StoreFailure, NewsItemModel>> addNewsItem(
      NewsItemModel newsItemModel) async {
    try {
      final exists = await checkIfNewsItemSaved(newsItemModel.title!);   // Check if the item already exists
    if (exists.isRight() && exists.getOrElse(() => false)) {
      return Left(FirestoreFailure('Item already exists'));
    }
      final news = FirebaseFirestore.instance.collection('news');
      final docRef = await news.add({
        ...newsItemModel.toMap(),
        'createdAt': FieldValue.serverTimestamp(),
      });
      final newItem = newsItemModel.copyWith(id: docRef.id);
      return Right(newItem);
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<StoreFailure, bool>> checkIfNewsItemSaved(String title) async {
    try {
      final news = FirebaseFirestore.instance.collection('news');
      final snapshot = await news.where('title', isEqualTo: title).limit(1).get();
      return Right(snapshot.docs.isNotEmpty);
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<StoreFailure, List<NewsItemModel>>> displayNewsItem(
      String category) async {
    try {
      final news = FirebaseFirestore.instance.collection('news');
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('news')
          .where('categoryName', isEqualTo: category)
          .orderBy('createdAt', descending: true)
          .get();

      List<NewsItemModel> newsList = [];
      for (var doc in querySnapshot.docs) {
        newsList.add(NewsItemModel.fromFirestore(
            doc.data() as Map<String, dynamic>, doc.id));
      }
      return Right(newsList);
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }

  @override
  Future<Either<StoreFailure, void>> removeNewsItem(String newsId) async {
    try {
      final news = FirebaseFirestore.instance.collection('news').doc(newsId);
      final doc = await news.get();
      if (!doc.exists) {
        return Left(FirestoreFailure('Item does not exist'));
      }
      await news.delete();
      return Right(null);
    } catch (e) {
      return Left(FirestoreFailure(e.toString()));
    }
  }
}