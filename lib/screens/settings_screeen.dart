import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp_riverpod/config/config.dart';
import 'package:todoapp_riverpod/utils/extensions.dart';

class SettingsScreeen extends ConsumerWidget {
  static SettingsScreeen builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SettingsScreeen();

  const SettingsScreeen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Define Theme Mode:',
                  style: context.textTheme.titleMedium?.copyWith(
                    //color: context.colorScheme.tertiary,
                    fontWeight: FontWeight.w500,
                  ),
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
                        'System default',
                        style: context.textTheme.titleMedium?.copyWith(
                          //color: context.colorScheme.tertiary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownMenuItem<ThemeMode>(
                      value: ThemeMode.dark,
                      child: Text(
                        'Dark',
                        style: context.textTheme.titleMedium?.copyWith(
                          // color: context.colorScheme.tertiary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    DropdownMenuItem<ThemeMode>(
                      value: ThemeMode.light,
                      child: Text(
                        'Ligth',
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
            )
          ],
        ),
      ),
    );
  }
}
