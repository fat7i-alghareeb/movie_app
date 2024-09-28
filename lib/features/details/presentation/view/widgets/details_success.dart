import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../shared/cubit/favorite cubit/favorite_movies_cubit.dart';
import '../../../data/domain/entities/movie_details_entity.dart';
import 'add_to_favorite_button.dart';
import 'details_body.dart';
import 'gradient.dart';

class DetailsSuccess extends StatelessWidget {
  const DetailsSuccess({
    super.key,
    required Animation<double> animation,
    required this.movieDetailsEntity,
  }) : _animation = animation;

  final Animation<double> _animation;
  final MovieDetailsEntity movieDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: DetailsBody(
            movie: movieDetailsEntity,
            animation: _animation,
          ),
        ),
        const GradientWidget(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 65.w, vertical: 20.h),
          child: BlocProvider(
            create: (context) => FavoriteMoviesCubit(),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(2, 0),
                end: Offset.zero,
              ).animate(_animation),
              child: AddToFavoriteButton(
                movie: movieDetailsEntity,
              ),
            ),
          ),
        )
      ],
    );
  }
}
