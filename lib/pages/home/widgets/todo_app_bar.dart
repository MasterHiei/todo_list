import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../providers/todos/todos_batch_delete_provider.dart';

class TodoAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batchDeleteEnabled = ref.watch(
      todosBatchDeleteProvider.select((state) => state.enabled),
    );

    return AppBar(
      title: batchDeleteEnabled
          ? const Text('Batch Delete')
          : const Text('Simple To-Do List'),
      actions: [
        if (!batchDeleteEnabled)
          IconButton(
            tooltip: 'ソースコード',
            icon: const Icon(Icons.code),
            onPressed: () => launchUrl(
              Uri.parse('https://github.com/MasterHiei/todo_list'),
            ),
          ),
        if (!batchDeleteEnabled)
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            tooltip: 'アーカイブ',
            icon: const Icon(Icons.archive_outlined),
            onPressed: () {},
          ),
        if (batchDeleteEnabled)
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            tooltip: '取消',
            icon: const Icon(Icons.close),
            onPressed: ref.read(todosBatchDeleteProvider.notifier).disbale,
          ),
      ],
      backgroundColor: batchDeleteEnabled ? Colors.red : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
