import 'package:movies_app/domain/entities/language_entity.dart';

export '../extensions/language_entity_extension.dart';

class Languages {
  const Languages._();

  static const languages = const [
    const LanguageEntity(code: 'pt', name: 'Português'),
    const LanguageEntity(code: 'en', name: 'English'),
  ];

  static LanguageEntity get defaultLanguage =>
      languages.firstWhere((lang) => lang.code == 'pt');

  static LanguageEntity findByCode(String code) =>
      languages.firstWhere((lang) => lang.code == code);

  static int indexWhere(String code) =>
      languages.indexWhere((lang) => lang.code == code);
}
