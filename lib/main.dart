import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constants.dart';
import 'features/dashboards/data/domain/entities/movie_entity.dart';
import 'shared/cubit/connectivity cubit/connectivity_cubit.dart';
import 'shared/cubit/cubit/user_info_cubit.dart';
import 'shared/cubit/cubit/user_info_state.dart';
import 'shared/entities/user_entity.dart';
import 'utils/extensions.dart';
import 'utils/router/router_paths.dart';
import 'utils/functions/setup_service_locator.dart';
import 'utils/router/app_router.dart';
import 'utils/themes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MovieEntityAdapter());
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox<MovieEntity>(Constants.kRecentViewedBox);
  await Hive.openBox<MovieEntity>(Constants.kFavoriteBox);
  await Hive.openBox<UserEntity>(Constants.kUserBox).then((e) => e.clear());

  setupServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConnectivityCubit()..checkInitialConnectivity(),
        ),
        BlocProvider(
          create: (context) => UserInfoCubit()..saveUser(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  late bool isDarkTheme;
  void _setInitialValues() {
    isDarkTheme = context.read<UserInfoCubit>().isDarkTheme;
  }

  @override
  void initState() {
    super.initState();
    _setInitialValues();
  }

  @override
  Widget build(BuildContext context) {
    log(context.screenHeight.toString());
    log(context.screenWidth.toString());
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor:
            isDarkTheme ? const Color(0xFF0e1621) : const Color(0xffffffff),
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocListener<UserInfoCubit, UserInfoState>(
        listener: (context, state) {
          if (state is EditThemeUserInfo) {
            isDarkTheme = context.read<UserInfoCubit>().isDarkTheme;
            setState(() {});
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CineVerse',
          initialRoute: KRouter.homeScreen,
          onGenerateRoute: _appRouter.generateRoute,
          theme: lightMode,
          darkTheme: darkMode,
          themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        ),
      ),
    );
  }
}
