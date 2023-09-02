import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/todos/todos_batch_delete_provider.dart';
import '../widgets/index.dart';
import 'widgets/index.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppBar(),
      body: const TodoListView(),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) => Consumer(
        builder: (_, ref, __) {
          final batchDeleteEnabled = ref.watch(
            todosBatchDeleteProvider.select((state) => state.enabled),
          );
          final hasChecked = ref.watch(
            todosBatchDeleteProvider
                .select((state) => state.checkedIds.isNotEmpty),
          );
          return FloatingActionButton(
            backgroundColor: batchDeleteEnabled ? Colors.red : Colors.blue,
            onPressed: batchDeleteEnabled
                ? hasChecked
                    ? () => _showConfirmDeleteBottomSheet(context, ref)
                    : null
                : () => _showCreateTodoBottomSheet(context),
            child: batchDeleteEnabled
                ? const Icon(Icons.delete)
                : const Icon(Icons.add),
          );
        },
      );

  Future<void> _showCreateTodoBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => const TodoInputBottomSheet(),
        isScrollControlled: true,
        isDismissible: false,
      );

  Future<void> _showConfirmDeleteBottomSheet(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showModalBottomSheet<bool>(
      context: context,
      builder: (_) => const TodoConfirmDeleteBottomSheet(),
    );
    if (confirmed == true) {
      ref.read(todosBatchDeleteProvider.notifier).execute();
    }
  }
}
