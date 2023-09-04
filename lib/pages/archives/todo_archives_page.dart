import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/entities/saved_todo.dart';
import '../../../providers/todos/todos_provider.dart';
import '../../providers/todos/todos_batch_delete_provider.dart';
import '../widgets/index.dart';
import 'widgets/index.dart';

class TodoArchivesPage extends ConsumerWidget {
  const TodoArchivesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async => !ref.read(batchDeleteEnabledProvider),
      child: Scaffold(
        appBar: const TodoAppBar(
          title: 'Completed Tasks',
          backgroundColor: Colors.green,
        ),
        body: _listView,
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) => Consumer(
        builder: (_, ref, __) {
          if (!ref.watch(batchDeleteEnabledProvider)) {
            return const SizedBox.shrink();
          }
          final hasChecked = ref.watch(
            todosBatchDeleteProvider.select(
              (state) => state.checkedIds.isNotEmpty,
            ),
          );
          return FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: hasChecked
                ? () => _showConfirmDeleteBottomSheet(context, ref)
                : null,
            child: const Icon(Icons.delete),
          );
        },
      );

  Widget get _listView => Consumer(
        builder: (_, ref, __) => ref
            .watch(todosProvider(isCompleted: true))
            .when(
              data: (todos) {
                final items =
                    todos.map(SavedTodo.from).map(TodoArchivesItemView.new);
                return ListView.builder(
                  itemBuilder: (_, index) => items.elementAt(index),
                  itemCount: items.length,
                );
              },
              error: (_, __) => const Center(
                child: Text('Something went wrong...'),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
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
