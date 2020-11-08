part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class LanguageChangeEvent extends LanguageEvent {
  final String languageCode;

  const LanguageChangeEvent(this.languageCode);

  @override
  List<Object> get props => [languageCode];
}
