import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/domain/repo/search_repo.dart';
import 'package:movie_app/features/home/presentation/manger/cubit/search_cubit.dart';
import 'package:movie_app/features/home/presentation/view/search%20widgets/search_success.dart';
import 'package:movie_app/utils/functions/setup_service_locator.dart';
import '../../../../utils/spacing.dart';
import 'search widgets/search_upper_part.dart';

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
            child: const SearchBody(),
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
