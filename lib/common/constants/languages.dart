import 'package:movies_app/domain/entities/language_entity.dart';

export '../extensions/language_entity_extension.dart';

class Languages {
  const Languages._();

  static const languages = const [
    const LanguageEntity(code: 'pt', name: 'Portuguese'),
    const LanguageEntity(code: 'en', name: 'English'),
  ];

  static LanguageEntity get defaultLanguage =>
      languages.firstWhere((lang) => lang.code == 'pt');
}
