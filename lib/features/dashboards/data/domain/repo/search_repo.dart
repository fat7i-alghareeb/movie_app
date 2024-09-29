import '../../../../../utils/errors/failure.dart';
import '../../../../../utils/services/movie_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../models/search_response.dart';

class SearchRepo {
  final ApiService apiService;

  SearchRepo(this.apiService);

  Future<Either<Failure, SearchResponse>> fetchSearchedMovies({
    required String searchQuery,
    int pageNumber = 1,
  }) async {
    try {
      SearchResponse searchResponse = await apiService.getSearchedMovies(
          searchQuery: searchQuery, pageNumber: pageNumber);

      if (searchResponse.response?.toLowerCase() == 'false' &&
          searchResponse.error != null) {
        if (searchResponse.error == "Movie not found!") {
          return left(ServerFailure("No movies found"));
        } else {
          return left(ServerFailure(searchResponse.error ?? "Unknown error"));
        }
      }

      // Otherwise, return the successful response
      return right(searchResponse);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDiorError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
