import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/router/routes.dart';
import '../../models/entities/saved_todo.dart';
import '../../providers/todos/todos_batch_delete_provider.dart';
import '../../providers/todos/todos_provider.dart';
import '../widgets/index.dart';
import 'widgets/index.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _listView,
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  TodoAppBar _buildAppBar(BuildContext context) => TodoAppBar(
        title: 'Remaining Tasks',
        actions: [
          Consumer(
            builder: (_, ref, __) {
              if (ref.watch(batchDeleteEnabledProvider)) {
                return const SizedBox.shrink();
              }
              return IconButton(
                tooltip: 'ソースコード',
                icon: const Icon(Icons.code),
                onPressed: () => launchUrl(
                  Uri.parse('https://github.com/MasterHiei/todo_list'),
                ),
              );
            },
          ),
          Consumer(
            builder: (_, ref, __) {
              if (ref.watch(batchDeleteEnabledProvider)) {
                return const SizedBox.shrink();
              }
              return IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                tooltip: 'アーカイブ',
                icon: const Icon(Icons.archive_outlined),
                onPressed: () => const ArchivesRoute().push(context),
              );
            },
          ),
        ],
      );

  Widget _buildFloatingActionButton(BuildContext context) => Consumer(
        builder: (_, ref, __) {
          final batchDeleteEnabled = ref.watch(batchDeleteEnabledProvider);
          final hasChecked = ref.watch(
            todosBatchDeleteProvider.select(
              (state) => state.checkedIds.isNotEmpty,
            ),
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

  Widget get _listView => Consumer(
        builder: (_, ref, __) => ref
            .watch(todosProvider(isCompleted: false))
            .when(
              data: (todos) {
                final items =
                    todos.map(SavedTodo.from).map(TodoListItemView.new);
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
