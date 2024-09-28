import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../constants.dart';
import '../../features/details/data/models/movie_details_model.dart';
import '../../features/home/data/models/search_response.dart';

part 'movie_service.g.dart';

@RestApi(baseUrl: "http://www.omdbapi.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET("/")
  Future<SearchResponse> getSearchedMovies({
    @Query("s") required String searchQuery,
    @Query("page") required int pageNumber,
    @Query("apikey") String apiKey = Constants.apiKey,
  });

  @GET("/")
  Future<MovieDetailsModel> getMovieDetails({
    @Query("i") required String imdbId,
    @Query("plot") String plotType = "full",
    @Query("apikey") String apiKe = Constants.apiKey,
  });
}
