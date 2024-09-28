import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/features/details/data/domain/entities/movie_details_entity.dart';
import '../../constants.dart';
import '../../features/home/data/domain/entities/movie_entity.dart';
import '../../utils/functions/save_movies_to_boxes.dart';

part 'favorite_movies_state.dart';

class FavoriteMoviesCubit extends Cubit<FavoriteMoviesState> {
  FavoriteMoviesCubit() : super(FavoriteMoviesInitial()) {
    _initBoxListener();
  }

  List<MovieEntity> movies = [];
  var movieBox = Hive.box<MovieEntity>(Constants.kFavoriteBox);

  void _initBoxListener() {
    // Listen to any changes in the Hive box
    movieBox.watch().listen((event) {
      fetchFavoriteMovies();
    });
  }

  bool checkMovieExisting(String movieId) {
    return checkExisting(movieId, Constants.kFavoriteBox);
  }

  Future<void> saveMovie(
      {required MovieDetailsEntity movieDetailsEntity}) async {
    try {
      MovieEntity movieEntity =
          MovieEntity.fromMovieDetails(movieDetailsEntity);
      await saveMovieData(movieEntity, Constants.kFavoriteBox);
      movies = movieBox.values.toList();
      emit(FavoriteMoviesSuccess());
    } catch (e) {
      emit(FavoriteMoviesFailure(message: e.toString()));
    }
  }

  Future<void> deleteMovie({required String id}) async {
    try {
      await deleteMovieData(id, Constants.kFavoriteBox);
      movies = movieBox.values.toList();
      emit(FavoriteMoviesSuccess());
    } catch (e) {
      emit(FavoriteMoviesFailure(message: e.toString()));
    }
  }

  void fetchFavoriteMovies() {
    try {
      movies = movieBox.values.toList();
      emit(FavoriteMoviesSuccess());
    } catch (e) {
      emit(FavoriteMoviesFailure(message: e.toString()));
    }
  }
}
