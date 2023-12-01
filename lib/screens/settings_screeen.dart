import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp_riverpod/config/config.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20).h,
        child: Column(
          children: [
            const ThemeSelector(),
            Gap(15.h),
            const LanguageSelector(),
          ],
        ),
      ),
    );
  }
}
