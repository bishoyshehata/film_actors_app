import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MovieActorsApp());
}

class MovieActorsApp extends StatelessWidget {
  const MovieActorsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) =>
                AppRoutes().onGenerateRoute(settings),
            initialRoute: AppRoutes.homeRoute,
          );
        });
  }
}
