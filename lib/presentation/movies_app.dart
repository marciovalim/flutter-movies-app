import 'package:flutter/material.dart';

import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:movies_app/presentation/themes/text_themes.dart';

import 'journeys/home/home_screen.dart';

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
        primaryColor: AppColors.vulcan,
        accentColor: AppColors.royalBlue,
        scaffoldBackgroundColor: AppColors.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: TextThemes.getTextTheme(),
      ),
      home: HomeScreen(),
    );
  }
}
