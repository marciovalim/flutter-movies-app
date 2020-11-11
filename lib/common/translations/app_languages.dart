import 'package:flutter_translation/flutter_translation.dart';
import 'package:movies_app/common/translations/pt_translator.dart';

import 'en_translator.dart';

class AppLanguages extends ILanguages {
  AppLanguages.singleton();

  @override
  LanguageEntity get defaultLanguage => this.findByCode('pt');

  @override
  List<LanguageEntity> createLanguages() {
    return [
      const LanguageEntity(
        code: 'pt',
        name: 'Português',
        translator: const PtTranslator(),
      ),
      const LanguageEntity(
        code: 'en',
        name: 'English',
        translator: const EnTranslator(),
      ),
    ];
  }
}
