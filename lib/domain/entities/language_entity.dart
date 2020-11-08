import 'package:flutter/foundation.dart';

export 'package:movies_app/common/extensions/language_entity_extension.dart';

class LanguageEntity {
  final String code;
  final String name;

  const LanguageEntity({@required this.code, @required this.name});
}
