import 'package:flutter/widgets.dart';
import 'package:movies_app/common/translations/app_translator.dart';
import 'package:movies_app/depen_injec/get_it.dart';

class Utils {
  static AppTranslator findTranslator(BuildContext context) {
    return getIt.get<AppTranslator>(param1: context);
  }
}
