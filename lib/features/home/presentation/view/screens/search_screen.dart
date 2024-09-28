import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/utils/functions/setup_service_locator.dart';
import '../../../../../shared/cubit/cubit/connectivity_cubit.dart';
import '../../../../../shared/widgets/connectivity_bar.dart';
import '../../../../../utils/spacing.dart';

import '../../../data/domain/repo/search_repo.dart';
import '../../manger/cubit/search_cubit.dart';
import '../search widgets/search_success.dart';
import '../search widgets/search_upper_part.dart';

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

class SearchBody extends StatefulWidget {
  const SearchBody({
    super.key,
  });

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 20,
      ),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SearchUpperPart()),
          sliverVerticalSpace(20),
          SearchSuccessWidget(scrollController: scrollController)
          //NumberOfResults(),
          // SliverSizedBox(height: 20),
          // SearchStates(),
        ],
      ),
    );
  }
}
