import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/details/data/domain/entities/movie_details_entity.dart';
import 'package:movie_app/utils/functions/show_toast.dart';
import '../../../../../shared/cubit/favorite cubit/favorite_movies_cubit.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../constants.dart';

class AddToFavoriteButton extends StatefulWidget {
  const AddToFavoriteButton({
    super.key,
    required this.movie,
  });
  final MovieDetailsEntity movie;
  @override
  State<AddToFavoriteButton> createState() => _AddToFavoriteButtonState();
}

class _AddToFavoriteButtonState extends State<AddToFavoriteButton> {
  late bool isExisting;
  @override
  void initState() {
    isExisting =
        context.read<FavoriteMoviesCubit>().checkMovieExisting(widget.movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteMoviesCubit, FavoriteMoviesState>(
      listener: (context, state) {
        if (state is FavoriteMoviesFailure) {
          showToast(message: state.message, color: Colors.red[700]);
        }
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () async {
            isExisting
                ? await context
                    .read<FavoriteMoviesCubit>()
                    .deleteMovie(id: widget.movie.id)
                : await context
                    .read<FavoriteMoviesCubit>()
                    .saveMovie(movieDetailsEntity: widget.movie);
            setState(() {
              isExisting = context
                  .read<FavoriteMoviesCubit>()
                  .checkMovieExisting(widget.movie.id);
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: context.heightPercentage(7),
            decoration: BoxDecoration(
              color: isExisting ? Colors.red[700] : context.accentColor(),
              borderRadius: BorderRadius.circular(Constants.borderRadius),
            ),
            child: Center(
              child: Text(
                isExisting ? "Remove from favorite" : "Add to favorite",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: context.primaryColor(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
