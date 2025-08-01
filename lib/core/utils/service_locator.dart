import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:newsify/core/utils/api_service.dart';
import 'package:newsify/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:newsify/feature/bookmark/data/repos/bookmark_repo_impl.dart';

final getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<BookmarkRepoImpl>(BookmarkRepoImpl());
}
