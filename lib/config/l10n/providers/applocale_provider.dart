import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/config/l10n/providers/applocale_notifier.dart';

final appLocaleProvider =
    StateNotifierProvider<ApplocaleNotifier, Locale>((ref) {
  return ApplocaleNotifier();
});
