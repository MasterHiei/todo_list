import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/todos/todos_batch_delete_provider.dart';

class TodoAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TodoAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batchDeleteEnabled = ref.watch(batchDeleteEnabledProvider);
    return AppBar(
      automaticallyImplyLeading: !batchDeleteEnabled,
      title: batchDeleteEnabled ? const Text('Batch Delete') : Text(title),
      actions: [
        ...actions ?? [],
        if (batchDeleteEnabled)
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            tooltip: '取消',
            icon: const Icon(Icons.close),
            onPressed: ref.read(todosBatchDeleteProvider.notifier).disbale,
          ),
      ],
      backgroundColor: batchDeleteEnabled ? Colors.red : backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
