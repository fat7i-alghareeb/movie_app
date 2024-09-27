import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/features/details/data/domain/entities/movie_details_entity.dart';

import 'rating.dart';
part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel extends MovieDetailsEntity {
  @JsonKey(name: 'Title')
  String titleField;
  @JsonKey(name: 'Year')
  String yearField;
  @JsonKey(name: 'Rated')
  String? ratedField;
  @JsonKey(name: 'Released')
  String? released;
  @JsonKey(name: 'Runtime')
  String? runtime;
  @JsonKey(name: 'Genre')
  String? genreField;
  @JsonKey(name: 'Director')
  String directorField;
  @JsonKey(name: 'Writer')
  String? writer;
  @JsonKey(name: 'Actors')
  String? actorsField;
  @JsonKey(name: 'Plot')
  String? plotField;
  @JsonKey(name: 'Language')
  String? languageField;
  @JsonKey(name: 'Country')
  String? country;
  @JsonKey(name: 'Awards')
  String? awardsField;
  @JsonKey(name: 'Poster')
  String? posterField;
  @JsonKey(name: 'Ratings')
  List<Rating>? ratings;
  @JsonKey(name: 'Metascore')
  String? metascore;
  @JsonKey(name: 'ImdbRating')
  String? imdbRating;
  @JsonKey(name: 'ImdbVotes')
  String? imdbVotes;
  @JsonKey(name: 'imdbID')
  String? imdbId;
  @JsonKey(name: 'Type')
  String? typeField;

  @JsonKey(name: 'BoxOffice')
  String? boxOffice;

  MovieDetailsModel({
    required this.titleField,
    required this.yearField,
    this.ratedField,
    this.released,
    this.runtime,
    this.genreField,
    required this.directorField,
    this.writer,
    this.actorsField,
    this.plotField,
    this.languageField,
    this.country,
    this.awardsField,
    this.posterField,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbId,
    this.typeField,
    this.boxOffice,
  }) : super(
            awards: awardsField ?? "",
            rated: ratedField ?? "pg-13",
            title: titleField,
            rating: imdbRating ?? "2",
            poster: posterField ?? Constants.dummyPoster,
            year: yearField,
            id: imdbId ?? "tt1201607",
            type: typeField ?? "movie",
            duration: runtime ?? "120 min",
            genre: genreField ?? "drama",
            director: directorField,
            actors: [],
            plot: plotField ?? "no plot",
            language: languageField ?? "English");

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
