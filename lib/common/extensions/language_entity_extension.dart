import 'package:flutter/widgets.dart';
import 'package:movies_app/domain/entities/language_entity.dart';

extension LanguageEntityExtension on LanguageEntity {
  Locale toLocale() => Locale(this.code);
}
