import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/cubit/connectivity cubit/connectivity_cubit.dart';
import '../../../../shared/widgets/connectivity_bar.dart';
import 'widgets/details_states.dart';

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
