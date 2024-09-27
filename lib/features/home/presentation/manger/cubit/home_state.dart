import '../../../../home/data/models/search_response.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final SearchResponse searchResponse;

  HomeSuccess({required this.searchResponse});
}

final class HomeFailure extends HomeState {
  final String message;

  HomeFailure({required this.message});
}

final class HomePaginationFailure extends HomeState {
  final String message;

  HomePaginationFailure({required this.message});
}

final class HomeLoading extends HomeState {}

final class HomePaginationLoading extends HomeState {}
