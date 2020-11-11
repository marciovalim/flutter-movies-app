import 'package:flutter/material.dart';
import 'package:movies_app/common/utils/find_translator.dart';
import 'package:responsive_size/responsive_size.dart';

import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/widgets/app_dialog.dart';

class AppAboutDialog extends StatelessWidget {
  const AppAboutDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = Utils.findTranslator(context);
    return AppDialog(
      title: translator.about,
      description: translator.aboutDescription,
      buttonText: translator.okay,
      body: Image.asset(
        'assets/pngs/tmdb_logo.png',
        height: Sizes.s32.h,
      ),
    );
  }
}
