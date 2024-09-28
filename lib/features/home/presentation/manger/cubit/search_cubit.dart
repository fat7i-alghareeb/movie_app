import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/features/home/data/domain/entities/movie_entity.dart';
import '../../../data/domain/repo/search_repo.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  late String searchText;
  List<MovieEntity> movies = [];
  bool hasMoreData = true;
  Future<void> fetchSearchedMovies({required String searchText}) async {
    this.searchText = searchText;
    movies = [];
    hasMoreData = true;

    Constants.searchedMoviesPageNumber = 1;
    emit(SearchLoading());

    var result = await searchRepo.fetchSearchedMovies(
      searchQuery: searchText,
      pageNumber: 1,
    );
    result.fold(
      (failure) {
        emit(SearchFailure(message: failure.message));
      },
      (searchResponse) {
        movies = searchResponse.movies ?? [];
        emit(
          SearchSuccess(searchResponse: searchResponse),
        );
      },
    );
  }

  Future<void> fetchPaginationMovies({int pageNumber = 1}) async {
    emit(SearchPaginationLoading());

    var result = await searchRepo.fetchSearchedMovies(
      searchQuery: searchText,
      pageNumber: pageNumber,
    );

    result.fold(
      (failure) {
        if (failure.message == "No movies found") {
          hasMoreData = false;
          emit(SearchPaginationEnd());
        }
        emit(SearchPaginationFailure(message: failure.message));
      },
      (searchResponse) {
        movies.addAll(searchResponse.movies ?? []);
        emit(SearchSuccess(searchResponse: searchResponse));
      },
    );
  }
}
