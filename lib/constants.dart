import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static double borderRadius = 16.r;
  static const String apiKey = "e49da361";
  static const String dummyPoster =
      "https://mlpnk72yciwc.i.optimole.com/cqhiHLc.IIZS~2ef73/w:auto/h:auto/q:75/https://bleedingcool.com/wp-content/uploads/2024/04/download-1.jpeg";
  static int famousMoviePageNumber = 1;
  static int searchedMoviesPageNumber = 1;
  static String kRecentViewedBox = "kRecentViewedBox";
  static String kFavoriteBox = "kFavoriteBox";
  static String kUserBox = "userBox";

  static const List<String> famousMovies = [
    "Mission: Impossible",
    "The Lord of the Rings",
    "The Matrix",
    "Avengers",
    "Jurassic Park",
    "Harry Potter",
    "Star Wars",
    "Fast and Furious",
    "Batman",
    "spider man",
    "x men",
    "Pirates of the Caribbean",
  ];
  static final randomMovie =
      famousMovies[Random().nextInt(famousMovies.length)];
}
