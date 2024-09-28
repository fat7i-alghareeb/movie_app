import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../domain/entities/movie_details_entity.dart';

import '../../../../utils/errors/failure.dart';
import '../../../../utils/services/movie_service.dart';

class DetailsRepo {
  final ApiService apiService;

  DetailsRepo(this.apiService);
  Future<Either<Failure, MovieDetailsEntity>> fetchMovieDetails({
    required String movieId,
  }) async {
    MovieDetailsEntity movieDetailsEntity;
    try {
      movieDetailsEntity = await apiService.getMovieDetails(imdbId: movieId);
      return right(movieDetailsEntity);
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
