import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../shared/cubit/connectivity%20cubit/connectivity_cubit.dart';
import '../../../../../utils/extensions.dart';
import '../../../../../utils/functions/setup_service_locator.dart';
import '../../../../../utils/router/router_paths.dart';
import '../../../../../shared/widgets/connectivity_bar.dart';
import '../../../data/domain/repo/search_repo.dart';
import '../../manger/search cubit/search_cubit.dart';
import '../home widgets/drawer_widget.dart';
import '../home widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.accentColor(),
        onPressed: () {
          context.pushNamed(KRouter.favoriteScreen);
          HapticFeedback.heavyImpact();
        },
        child: Icon(
          Icons.favorite,
          color: context.primaryColor(),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<ConnectivityCubit, ConnectivityState>(
          builder: (context, state) {
            bool isOnline = state is ConnectivityOnline;
            return Stack(
              children: [
                BlocProvider(
                  create: (context) => SearchCubit(getIt.get<SearchRepo>())
                    ..fetchSearchedMovies(searchText: randomMovie),
                  child: const HomeBody(),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: ConnectivityBar(
                    isOnline: isOnline,
                    checkFirstBuild: true,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
