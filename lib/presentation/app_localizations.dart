import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/common/constants/languages.dart';

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  final Locale locale;
  AppLocalizations(this.locale);

  Map<String, String> _localizedStrings;

  static AppLocalizations of(BuildContext context) =>
      Localizations.of(context, AppLocalizations);

  String translate(String key) {
    return _localizedStrings[key];
  }

  Future _load() async {
    final jsonString = await rootBundle
        .loadString('assets/languages/${locale.languageCode}.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return Languages.languages.any((lang) => lang.code == locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final appLocalizations = AppLocalizations(locale);
    await appLocalizations._load();
    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}
