import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/features/home/data/domain/entities/movie_entity.dart';
import '../../../../../../utils/functions/save_movies_to_boxes.dart';
import 'recent_viewed_movies_state.dart';

class RecentViewedMoviesCubit extends Cubit<RecentViewedMoviesState> {
  RecentViewedMoviesCubit() : super(RecentViewedMoviesInitial());
  List<MovieEntity> _movies = [];
  get movies => _movies;
  void addToRecentView(MovieEntity movies) {
    try {
      _movies = saveMovieToRecentData(movies);
      emit(RecentViewedMoviesSuccess());
    } catch (e) {
      emit(RecentViewedMoviesFailure(errorMessage: e.toString()));
    }
  }

  void fetchRecentViewedMovies() {
    try {
      var box = Hive.box<MovieEntity>(Constants.kRecentViewedBox);
      _movies = box.values.toList();
      emit(RecentViewedMoviesSuccess());
    } catch (e) {
      emit(RecentViewedMoviesFailure(errorMessage: e.toString()));
    }
  }
}
