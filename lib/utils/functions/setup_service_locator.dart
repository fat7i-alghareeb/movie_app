import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/features/home/data/domain/repo/search_repo.dart';

import '../services/movie_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      createAndSetupDio(),
    ),
  );
  // getIt.registerSingleton<UserRepo>(UserRepo());
  getIt.registerSingleton<SearchRepo>(
    SearchRepo(
      getIt.get<ApiService>(),
    ),
  );
  // getIt.registerSingleton<DetailsRepo>(
  //   DetailsRepo(
  //     getIt.get<ApiService>(),
  //   ),
  // );
  // getIt.registerSingleton<SearchRepo>(
  //   SearchRepo(
  //     getIt.get<ApiService>(),
  //   ),
  // );
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = const Duration(milliseconds: 20000)
    ..options.receiveTimeout = const Duration(milliseconds: 20000);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
