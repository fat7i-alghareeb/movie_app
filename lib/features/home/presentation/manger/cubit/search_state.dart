import '../../../../home/data/models/search_response.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchSuccess extends SearchState {
  final SearchResponse searchResponse;

  SearchSuccess({required this.searchResponse});
}

final class SearchFailure extends SearchState {
  final String message;

  SearchFailure({required this.message});
}

final class SearchPaginationFailure extends SearchState {
  final String message;

  SearchPaginationFailure({required this.message});
}

final class SearchLoading extends SearchState {}

final class SearchPaginationLoading extends SearchState {}
