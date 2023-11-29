import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp_riverpod/config/l10n/l10n.dart';
import 'package:todoapp_riverpod/data/models/models.dart';
import 'package:todoapp_riverpod/providers/providers.dart';
import 'package:todoapp_riverpod/utils/extensions.dart';

class AppAlerts {
  AppAlerts._();

  static displaySnackBar(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        backgroundColor: context.colorScheme.primary,
      ),
    );
  }

  static Future<void> showDeleteAlertDialog(
    BuildContext context,
    WidgetRef ref,
    Task task,
  ) async {
    final l10n = context.l10n;
    Widget cancelButton = TextButton(
      onPressed: () => context.pop(),
      child: Text(
        l10n.no,
      ),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        await ref.read(taskProvider.notifier).deleteTask(task).then((value) {
          AppAlerts.displaySnackBar(
            context,
            l10n.delete,
          );
          context.pop();
        });
      },
      child: Text(
        l10n.yes,
      ),
    );
    AlertDialog alert = AlertDialog.adaptive(
      title: Text(
        l10n.question,
      ),
      actions: [
        deleteButton,
        cancelButton,
      ],
    );

    await showDialog(
      context: context,
      builder: (_) => alert,
    );
  }
}
