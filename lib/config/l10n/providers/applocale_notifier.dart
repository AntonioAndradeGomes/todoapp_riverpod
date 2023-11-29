import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/utils/shared_prefs.dart';

const localeKey = 'locale';

enum AppLocale {
  en(
    Locale(
      'en',
      'US',
    ),
  ),
  pt(
    Locale(
      'pt',
      'BR',
    ),
  );

  final Locale locale;
  const AppLocale(
    this.locale,
  );
}

class ApplocaleNotifier extends StateNotifier<Locale> {
  ApplocaleNotifier() : super(AppLocale.en.locale) {
    _initializeLocale();
  }

  void _initializeLocale() {
    try {
      final locale = SharedPrefs.instance.getString(localeKey) ?? "en_US";
      if (locale == 'en_US') {
        state = AppLocale.en.locale;
      } else {
        state = AppLocale.pt.locale;
      }
    } catch (e) {
      state = AppLocale.en.locale;
    }
  }

  void setLocale(Locale locale) async {
    state = locale;
    await SharedPrefs.instance.setString(
      localeKey,
      locale.toString(),
    );
  }
}
