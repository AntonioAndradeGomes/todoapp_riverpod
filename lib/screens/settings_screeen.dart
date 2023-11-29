import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp_riverpod/config/config.dart';
import 'package:todoapp_riverpod/widgets/theme_selector.dart';
import '../widgets/widgets.dart';

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
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteText(
          text: l10n.settings,
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ThemeSelector(),
            Gap(15),
            LanguageSelector(),
          ],
        ),
      ),
    );
  }
}
