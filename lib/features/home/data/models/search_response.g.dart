// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      response: json['Response'] as String?,
      error: json['Error'] as String?,
      totalResults: json['totalResults'] as String?,
      movies: (json['Search'] as List<dynamic>?)
          ?.map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'Response': instance.response,
      'Error': instance.error,
      'totalResults': instance.totalResults,
      'Search': instance.movies,
    };
