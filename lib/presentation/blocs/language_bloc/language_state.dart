part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  final Locale locale;

  const LanguageState(this.locale);

  @override
  List<Object> get props => [locale];
}

class LanguageLoadedState extends LanguageState {
  const LanguageLoadedState(Locale locale) : super(locale);
}
