import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp_riverpod/config/config.dart';
import 'package:todoapp_riverpod/config/l10n/arb/app_localizations.dart';

import '../config/l10n/providers/providers.dart';

//MainApp
class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final routeConfig = ref.watch(routesProvider);
    final appLocale = ref.watch(appLocaleProvider);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: theme,
          locale: appLocale,
          routerConfig: routeConfig,
        );
      },
    );
  }
}
