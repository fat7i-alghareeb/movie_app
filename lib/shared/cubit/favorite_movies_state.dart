part of 'favorite_movies_cubit.dart';

class FavoriteMoviesState {}

final class FavoriteMoviesInitial extends FavoriteMoviesState {}

final class FavoriteMoviesSuccess extends FavoriteMoviesState {}

final class FavoriteMoviesFailure extends FavoriteMoviesState {
  final String message;

  FavoriteMoviesFailure({required this.message});
}
