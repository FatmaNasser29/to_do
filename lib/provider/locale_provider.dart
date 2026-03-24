import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  String currentLocale = "en";

  changeCurrentLocale(String newLocale) {
    if (currentLocale == newLocale) return;
    currentLocale = newLocale;
    notifyListeners();
  }
}
