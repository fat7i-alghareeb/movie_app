import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/domain/repo/search_repo.dart';

import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  late String searchText;
  Future<void> fetchSearchedMovies({required String searchText}) async {
    this.searchText = searchText;
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
        emit(SearchPaginationFailure(message: failure.message));
      },
      (searchResponse) {
        emit(
          SearchSuccess(searchResponse: searchResponse),
        );
      },
    );
  }
}
