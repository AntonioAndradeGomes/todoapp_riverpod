import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todoapp_riverpod/providers/providers.dart';
import 'package:todoapp_riverpod/utils/extensions.dart';
import 'package:todoapp_riverpod/utils/task_categories.dart';
import 'package:todoapp_riverpod/widgets/widgets.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = TaskCategories.values.toList();
    final selectedCategory = ref.watch(categoryProvider);
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleLarge,
          ),
          const Gap(10),
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = categories[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  child: CircleContainer(
                    color: category.color.withOpacity(0.3),
                    child: Icon(
                      category.icon,
                      color: category == selectedCategory
                          ? context.colorScheme.primary
                          : category.color,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, index) {
                return const Gap(8);
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
