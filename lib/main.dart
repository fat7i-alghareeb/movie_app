import 'package:flutter/material.dart';
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
    isDarkTheme = false;
  }

  @override
  void initState() {
    super.initState();
    _setInitialValues();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     systemNavigationBarColor:
    //         isDarkTheme ? const Color(0xFF1D182A) : const Color(0xffffffff),
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      initialRoute: KRouter.homeScreen,
      onGenerateRoute: _appRouter.generateRoute,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
