import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/extensions.dart';

import '../../../../../shared/widgets/error_widget.dart';
import '../../manger/details book cubit/cubit/details_cubit.dart';
import '../../manger/details book cubit/cubit/details_state.dart';
import 'details_success.dart';

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
          return DetailsSuccess(
            animation: _animation,
            movieDetailsEntity: state.movieDetailsEntity,
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
