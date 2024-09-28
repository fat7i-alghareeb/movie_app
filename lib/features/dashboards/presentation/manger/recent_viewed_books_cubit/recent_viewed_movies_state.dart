abstract class RecentViewedMoviesState {}

final class RecentViewedMoviesInitial extends RecentViewedMoviesState {}

final class RecentViewedMoviesSuccess extends RecentViewedMoviesState {}

final class RecentViewedMoviesFailure extends RecentViewedMoviesState {
  final String errorMessage;

  RecentViewedMoviesFailure({required this.errorMessage});
}
