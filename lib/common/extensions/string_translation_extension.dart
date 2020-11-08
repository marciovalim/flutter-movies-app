import 'package:flutter/widgets.dart';
import 'package:movies_app/presentation/app_localizations.dart';

extension StringTranslationExtension on String {
  String translate(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
