import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/constants.dart';

import '../../features/home/data/domain/entities/movie_entity.dart';

Future<void> saveMovieData(MovieEntity movie, String boxName) async {
  var box = Hive.box<MovieEntity>(boxName);
  await box.add(movie);
}

Future<void> deleteMovieData(String id, String boxName) async {
  var box = Hive.box<MovieEntity>(boxName);
  int index;
  final movies = box.values.toList();
  index = movies.indexWhere(
    (element) => id == element.id,
  );
  await box.deleteAt(index);
}

bool checkExisting(String id, String boxName) {
  var box = Hive.box<MovieEntity>(boxName);
  final isExist = box.values.toList().indexWhere(
        (element) => id == element.id,
      );
  return isExist == -1 ? false : true;
}

List<MovieEntity> saveMovieToRecentData(MovieEntity movie) {
  var movieBox = Hive.box<MovieEntity>(Constants.kRecentViewedBox);

  int existingMovieIndex = -1;
  for (int i = 0; i < movieBox.length; i++) {
    if (movieBox.getAt(i)?.id == movie.id) {
      existingMovieIndex = i;
      break;
    }
  }

  if (existingMovieIndex != -1) {
    movieBox.deleteAt(existingMovieIndex);
  }

  if (movieBox.length >= 15) {
    movieBox.deleteAt(0);
  }
  movieBox.add(movie);
  return movieBox.values.toList();
}
