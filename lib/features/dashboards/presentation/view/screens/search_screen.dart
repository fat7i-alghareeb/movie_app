import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/functions/setup_service_locator.dart';
import '../../../../../shared/cubit/connectivity cubit/connectivity_cubit.dart';
import '../../../../../shared/widgets/connectivity_bar.dart';
import '../../../data/domain/repo/search_repo.dart';
import '../../manger/search cubit/search_cubit.dart';
import '../search widgets/search_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: BlocProvider(
            create: (context) => SearchCubit(getIt.get<SearchRepo>()),
            child: BlocBuilder<ConnectivityCubit, ConnectivityState>(
              builder: (context, state) {
                bool isOnline = state is ConnectivityOnline;
                return Stack(
                  children: [
                    const SearchBody(),
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
        ),
      ),
    );
  }
}
