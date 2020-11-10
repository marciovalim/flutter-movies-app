import 'package:flutter/material.dart';
import 'package:movies_app/presentation/themes/app_colors.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;
  final Locale locale;

  const WiredashApp({
    Key key,
    @required this.navigatorKey,
    @required this.child,
    @required this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'flutter-movies-app-l82sh6k',
      secret: '7c9z42erc6uqwdrccryoo6jbnxh3xq0i',
      navigatorKey: navigatorKey,
      options: WiredashOptionsData(
        locale: locale,
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.royalBlue,
        secondaryColor: AppColors.violet,
        secondaryBackgroundColor: AppColors.vulcan,
        dividerColor: AppColors.vulcan,
      ),
      child: child,
    );
  }
}
