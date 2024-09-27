// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      posterField: json['Poster'] as String,
      titleField: json['Title'] as String,
      yearField: json['Year'] as String,
      imdbID: json['imdbID'] as String,
      typeField: json['Type'] as String,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'Title': instance.titleField,
      'Year': instance.yearField,
      'imdbID': instance.imdbID,
      'Type': instance.typeField,
      'Poster': instance.posterField,
    };
