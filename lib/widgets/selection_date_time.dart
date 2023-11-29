import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:todoapp_riverpod/config/l10n/l10n.dart';
import 'package:todoapp_riverpod/providers/providers.dart';
import 'package:todoapp_riverpod/utils/utils.dart';
import 'package:todoapp_riverpod/widgets/common_text_field.dart';
import 'package:intl/intl.dart';

class SelectionDateTime extends ConsumerWidget {
  const SelectionDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final l10n = context.l10n;
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            title: l10n.date,
            hintText: DateFormat.yMMMd().format(date),
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => Helpers.selectDate(
                context,
                ref,
              ),
              icon: const FaIcon(
                FontAwesomeIcons.calendar,
              ),
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: CommonTextField(
            title: l10n.time,
            hintText: Helpers.timeToString(time),
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => _selectTime(
                context,
                ref,
              ),
              icon: const FaIcon(
                FontAwesomeIcons.clock,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final initialTime = ref.read(timeProvider);
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }
}
