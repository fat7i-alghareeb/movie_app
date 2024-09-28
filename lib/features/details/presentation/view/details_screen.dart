import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/features/details/presentation/manger/details%20book%20cubit/cubit/details_cubit.dart';
import 'package:movie_app/features/details/presentation/manger/details%20book%20cubit/cubit/details_state.dart';
import 'package:movie_app/shared/widgets/error_widget.dart';
import '../../../../utils/extensions.dart';
import 'widgets/add_to_favorite_button.dart';
import 'widgets/details_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.movieId,
  });
  final String movieId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DetailsMovieCubit, DetailsMovieState>(
          builder: (context, state) {
            if (state is DetailsMovieSuccess) {
              return Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: DetailsBody(
                      movie: state.movieDetailsEntity,
                    ),
                  ),
                  const Gradient(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 65.w, vertical: 20.h),
                    child: const AddToFavoriteButton(),
                  )
                ],
              );
            } else if (state is DetailsMovieFailure) {
              return Center(
                child: OnFetchErrorWidget(errorMessage: state.message),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: context.accentColor(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class Gradient extends StatelessWidget {
  const Gradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                context.primaryColor().withOpacity(0.4),
                //   context.primaryColor().withOpacity(0.3),
                context.primaryColor().withOpacity(0.1),
                context.primaryColor().withOpacity(0),
                Colors.transparent,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
