import 'package:movie_app/features/details/data/domain/entities/movie_details_entity.dart';

abstract class DetailsMovieState {}

final class DetailsMovieInitial extends DetailsMovieState {}

final class DetailsMovieLoading extends DetailsMovieState {}

final class DetailsMovieSuccess extends DetailsMovieState {
  final MovieDetailsEntity movieDetailsEntity;

  DetailsMovieSuccess({required this.movieDetailsEntity});
}

final class DetailsMovieFailure extends DetailsMovieState {
  final String message;

  DetailsMovieFailure({required this.message});
}
