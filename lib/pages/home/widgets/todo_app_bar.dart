import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          icon: batchDeleteEnabled
              ? const Icon(FontAwesomeIcons.xmark)
              : const Icon(FontAwesomeIcons.githubAlt),
          onPressed: batchDeleteEnabled
              ? ref.read(todosBatchDeleteProvider.notifier).disbale
              : () => launchUrl(
                    Uri.parse('https://github.com/MasterHiei/todo_list'),
                  ),
        ),
      ],
      backgroundColor: batchDeleteEnabled ? Colors.red : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
