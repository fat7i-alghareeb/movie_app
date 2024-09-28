import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/extensions.dart';
import '../../../../shared/cubit/connectivity cubit/connectivity_cubit.dart';
import '../../../../shared/cubit/favorite cubit/favorite_movies_cubit.dart';
import '../../../../shared/widgets/connectivity_bar.dart';
import '../../../../shared/widgets/error_widget.dart';
import '../manger/details book cubit/cubit/details_cubit.dart';
import '../manger/details book cubit/cubit/details_state.dart';
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
        child: BlocBuilder<ConnectivityCubit, ConnectivityState>(
          builder: (context, state) {
            bool isOnline = state is ConnectivityOnline;
            return Stack(
              children: [
                DetailsStates(
                  movieId: movieId,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ConnectivityBar(isOnline: isOnline),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DetailsStates extends StatefulWidget {
  const DetailsStates({
    super.key,
    required this.movieId,
  });
  final String movieId;

  @override
  State<DetailsStates> createState() => _DetailsStatesState();
}

class _DetailsStatesState extends State<DetailsStates>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsMovieCubit, DetailsMovieState>(
      builder: (context, state) {
        if (state is DetailsMovieSuccess) {
          return Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: DetailsBody(
                  movie: state.movieDetailsEntity,
                  animation: _animation,
                ),
              ),
              const Gradient(),
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
                      movie: state.movieDetailsEntity,
                    ),
                  ),
                ),
              )
            ],
          );
        } else if (state is DetailsMovieFailure) {
          return Center(
            child: OnFetchErrorWidget(
              errorMessage: state.message,
              onRetry: () => context
                  .read<DetailsMovieCubit>()
                  .fetchMovieDetails(movieId: widget.movieId),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: context.accentColor(),
            ),
          );
        }
      },
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
