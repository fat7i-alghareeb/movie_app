// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      titleField: json['Title'] as String,
      yearField: json['Year'] as String,
      ratedField: json['Rated'] as String?,
      released: json['Released'] as String?,
      runtime: json['Runtime'] as String?,
      genreField: json['Genre'] as String?,
      directorField: json['Director'] as String,
      writer: json['Writer'] as String?,
      actorsField: json['Actors'] as String?,
      plotField: json['Plot'] as String?,
      languageField: json['Language'] as String?,
      awardsField: json['Awards'] as String?,
      posterField: json['Poster'] as String?,
      ratings: (json['Ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      metascore: json['Metascore'] as String?,
      imdbRating: json['imdbRating'] as String?,
      imdbVotes: json['imdbVotes'] as String?,
      imdbId: json['imdbID'] as String?,
      typeField: json['Type'] as String?,
      boxOffice: json['BoxOffice'] as String?,
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'Title': instance.titleField,
      'Year': instance.yearField,
      'imdbRating': instance.imdbRating,
      'imdbVotes': instance.imdbVotes,
      'Rated': instance.ratedField,
      'Released': instance.released,
      'Runtime': instance.runtime,
      'Genre': instance.genreField,
      'Director': instance.directorField,
      'Writer': instance.writer,
      'Actors': instance.actorsField,
      'Plot': instance.plotField,
      'Language': instance.languageField,
      'Awards': instance.awardsField,
      'Poster': instance.posterField,
      'Ratings': instance.ratings,
      'Metascore': instance.metascore,
      'imdbID': instance.imdbId,
      'Type': instance.typeField,
      'BoxOffice': instance.boxOffice,
    };
