import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/extensions.dart';
import 'package:movie_app/utils/router/router_paths.dart';
import 'utils/router/app_router.dart';
import 'utils/themes.dart';

void main() async {
  runApp(
    const MyApp(),
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
    isDarkTheme = true;
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
            isDarkTheme ? const Color(0xFF1D182A) : const Color(0xffffffff),
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CineVerse',
        initialRoute: KRouter.detailsScreen,
        onGenerateRoute: _appRouter.generateRoute,
        theme: lightMode,
        darkTheme: darkMode,
        themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}
