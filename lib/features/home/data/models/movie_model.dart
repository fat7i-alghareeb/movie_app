import 'package:json_annotation/json_annotation.dart';
import '../domain/entities/movie_entity.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends MovieEntity {
  @JsonKey(name: 'Title')
  final String titleField;

  @JsonKey(name: 'Year')
  final String yearField;

  @JsonKey(name: 'imdbID')
  final String imdbID;

  @JsonKey(name: 'Type')
  final String typeField;

  @JsonKey(name: 'Poster')
  final String posterField;

  MovieModel({
    required this.posterField,
    required this.titleField,
    required this.yearField,
    required this.imdbID,
    required this.typeField,
  }) : super(
          id: imdbID,
          poster: posterField,
          title: titleField,
          year: yearField,
          type: typeField,
        );
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
