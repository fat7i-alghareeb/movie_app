import 'package:json_annotation/json_annotation.dart';
import 'movie_model.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  String? totalResults;
  @JsonKey(name: 'Search')
  List<MovieModel> movies;

  SearchResponse({
    required this.movies,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
