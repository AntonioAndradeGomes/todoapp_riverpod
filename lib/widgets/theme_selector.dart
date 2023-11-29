import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp_riverpod/config/config.dart';
import 'package:todoapp_riverpod/utils/utils.dart';

class ThemeSelector extends ConsumerWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          l10n.defineTheme,
          style: context.textTheme.headlineSmall,
        ),
        DropdownButton<ThemeMode>(
          value: theme,
          icon: const Icon(Icons.color_lens_sharp),
          isDense: true,
          elevation: 0,
          alignment: Alignment.center,
          iconSize: 25,
          dropdownColor: context.colorScheme.secondary,
          items: [
            DropdownMenuItem<ThemeMode>(
              value: ThemeMode.system,
              child: Text(
                l10n.defaultTheme,
                style: context.textTheme.titleMedium?.copyWith(
                  //color: context.colorScheme.tertiary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DropdownMenuItem<ThemeMode>(
              value: ThemeMode.dark,
              child: Text(
                l10n.dark,
                style: context.textTheme.titleMedium?.copyWith(
                  // color: context.colorScheme.tertiary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            DropdownMenuItem<ThemeMode>(
              value: ThemeMode.light,
              child: Text(
                l10n.light,
                style: context.textTheme.titleMedium?.copyWith(
                  // color: context.colorScheme.tertiary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
          onChanged: (ThemeMode? value) {
            ref
                .read(
                  themeProvider.notifier,
                )
                .changeTheme(value!);
          },
        ),
      ],
    );
  }
}
