import 'package:flutter/material.dart';
import 'package:movies_app/common/app_translations/app_translator.dart';
import 'package:movies_app/depen_injec/get_it.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/widgets/app_dialog.dart';

class AppAboutDialog extends StatelessWidget {
  const AppAboutDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: getIt.get<AppTranslator>(param1: context).about,
      description: getIt.get<AppTranslator>(param1: context).aboutDescription,
      buttonText: getIt.get<AppTranslator>(param1: context).okay,
      body: Image.asset(
        'assets/pngs/tmdb_logo.png',
        height: Sizes.s32.h,
      ),
    );
  }
}
