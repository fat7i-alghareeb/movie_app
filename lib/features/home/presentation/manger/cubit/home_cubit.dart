import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/domain/repo/search_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.searchRepo) : super(HomeInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedMovies(
      {required String searchText, int pageNumber = 1}) async {
    pageNumber == 1 ? emit(HomeLoading()) : emit(HomePaginationLoading());

    var result = await searchRepo.fetchSearchedMovies(
      searchQuery: searchText,
      pageNumber: pageNumber,
    );
    result.fold(
      (failure) {
        pageNumber == 1
            ? emit(HomeFailure(message: failure.message))
            : emit(HomePaginationFailure(message: failure.message));
      },
      (searchResponse) {
        emit(
          HomeSuccess(searchResponse: searchResponse),
        );
      },
    );
  }
}
