import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/domain/repo/search_repo.dart';

import 'home_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedMovies(
      {required String searchText, int pageNumber = 1}) async {
    pageNumber == 1 ? emit(SearchLoading()) : emit(SearchPaginationLoading());

    var result = await searchRepo.fetchSearchedMovies(
      searchQuery: searchText,
      pageNumber: pageNumber,
    );
    result.fold(
      (failure) {
        pageNumber == 1
            ? emit(SearchFailure(message: failure.message))
            : emit(SearchPaginationFailure(message: failure.message));
      },
      (searchResponse) {
        emit(
          SearchSuccess(searchResponse: searchResponse),
        );
      },
    );
  }
}
