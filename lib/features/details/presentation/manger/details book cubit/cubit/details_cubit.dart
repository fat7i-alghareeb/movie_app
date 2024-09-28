import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repo/details_repo.dart';
import 'details_state.dart';

class DetailsMovieCubit extends Cubit<DetailsMovieState> {
  DetailsMovieCubit(this.detailsRepo) : super(DetailsMovieInitial());
  final DetailsRepo detailsRepo;
  Future<void> fetchMovieDetails({
    required String movieId,
  }) async {
    emit(DetailsMovieLoading());

    var result = await detailsRepo.fetchMovieDetails(movieId: movieId);
    result.fold(
      (failure) {
        emit(DetailsMovieFailure(message: failure.message));
      },
      (movieDetailsEntity) {
        emit(
          DetailsMovieSuccess(movieDetailsEntity: movieDetailsEntity),
        );
      },
    );
  }
}
