import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/config/l10n/l10n.dart';
import 'package:todoapp_riverpod/config/l10n/providers/applocale_provider.dart';
import 'package:todoapp_riverpod/utils/utils.dart';

import '../config/l10n/providers/applocale_notifier.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(appLocaleProvider);
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          l10n.selectLanguage,
          style: context.textTheme.headlineSmall,
        ),
        DropdownButton<Locale>(
          value: selectedLanguage,
          icon: const Icon(Icons.language),
          isDense: true,
          elevation: 0,
          alignment: Alignment.center,
          iconSize: 25,
          dropdownColor: context.colorScheme.secondary,
          items: _getSupportedLocale
              .map<DropdownMenuItem<Locale>>(
                (e) => DropdownMenuItem<Locale>(
                  value: e,
                  child: Text(
                    e.languageCode.toUpperCase(),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              ref.read(appLocaleProvider.notifier).setLocale(value);
            }
          },
        ),
      ],
    );
  }

  List<Locale> get _getSupportedLocale => List.generate(
        AppLocale.values.length,
        (index) => AppLocale.values[index].locale,
      );
}
