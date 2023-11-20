import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/utils/shared_prefs.dart';

const themeKey = 'isDarkTheme';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    _getThemeFromPrefs();
  }

  void _getThemeFromPrefs() {
    final isDarkTheme = SharedPrefs.instance.getBool(themeKey);
    if (isDarkTheme == null) {
      state = ThemeMode.system;
      return;
    }
    state = isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme(ThemeMode themeMode) {
    state = themeMode;
    if (themeMode == ThemeMode.system) {
      SharedPrefs.instance.remove(themeKey);
      return;
    }
    SharedPrefs.instance.setBool(
      themeKey,
      themeMode == ThemeMode.dark,
    );
  }
}
