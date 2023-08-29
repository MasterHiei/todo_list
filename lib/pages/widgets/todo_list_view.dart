import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entities/saved_todo.dart';
import '../../providers/incomplete_todos_provider.dart';
import 'todo_list_item_view.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(incompleteTodosProvider).when(
          data: (todos) {
            final items =
                todos.map(SavedTodo.from).map(TodoListItemView.new).toList();
            return ListView.builder(
              itemBuilder: (_, index) => items[index],
              itemCount: items.length,
            );
          },
          error: (_, __) => const Center(child: Text('Error!!!')),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
