import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/details/data/repo/details_repo.dart';
import '../../features/dashboards/data/domain/repo/search_repo.dart';
import '../../features/dashboards/presentation/manger/recent_viewed_books_cubit/recent_viewed_books_cubit.dart';
import '../services/movie_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      createAndSetupDio(),
    ),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepo(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<DetailsRepo>(
    DetailsRepo(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<RecentViewedMoviesCubit>(RecentViewedMoviesCubit());
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
