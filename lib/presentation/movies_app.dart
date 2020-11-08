import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app/common/constants/languages.dart';
import 'package:movies_app/presentation/app_localizations.dart';

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
        unselectedWidgetColor: AppColors.royalBlue,
        scaffoldBackgroundColor: AppColors.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: TextThemes.getTextTheme(),
      ),
      supportedLocales: Languages.languages.map((lang) => lang.toLocale()),
      locale: Languages.defaultLanguage.toLocale(),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: HomeScreen(),
    );
  }
}
