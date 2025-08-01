import 'package:cloud_firestore/cloud_firestore.dart';

class NewsItemModel {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? publishedAt;
  final String? authorName;
  final String categoryName;
  final String? content;
  final Timestamp? createdAt;

  NewsItemModel( {
    this.id,
    this.content,
     this.title,
     this.description,
     this.imageUrl,
     this.publishedAt,
     this.authorName,
    required this.categoryName,
    this.createdAt,
   });

  factory NewsItemModel.fromJson( Map<String,dynamic> json, String category) {
    return NewsItemModel(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['urlToImage'] ?? 'No Image',
      publishedAt: json['publishedAt'] ?? 'No Date',
      authorName: json['author'] ?? 'No Author',
      categoryName: category ,
      content: json['content'] ?? 'No Content',
      //createdAt: json['createdAt'] ?? FieldValue.serverTimestamp(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'publishedAt': publishedAt,
      'authorName': authorName,
      'categoryName': categoryName,
      'content': content,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }

  factory NewsItemModel.fromFirestore(Map<String, dynamic> data, String id) {
  return NewsItemModel(
    id: id,
    title: data['title'],
    description: data['description'],
    imageUrl: data['imageUrl'],
    publishedAt: data['publishedAt'],
    authorName: data['authorName'],
    categoryName: data['categoryName'] ?? 'No Category',
    content: data['content'],
    createdAt: data['createdAt'],
  );
}

NewsItemModel copyWith({
  String? id,
  String? title,
  String? description,
  String? imageUrl,
  String? publishedAt,
  String? authorName,
  String? categoryName,
  String? content,
}) {
  return NewsItemModel(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    imageUrl: imageUrl ?? this.imageUrl,
    publishedAt: publishedAt ?? this.publishedAt,
    authorName: authorName ?? this.authorName,
    categoryName: categoryName ?? this.categoryName,
    content: content ?? this.content,
  );
}

}