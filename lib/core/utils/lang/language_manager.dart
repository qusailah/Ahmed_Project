import 'package:flutter/cupertino.dart';

class LanguageManager {
  static const enLocale = Locale('en');
  static const trLocale = Locale('ar');

  static List<Locale> get supportedLocales => [enLocale, trLocale];
}
