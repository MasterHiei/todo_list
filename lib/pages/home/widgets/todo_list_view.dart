import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../entities/saved_todo.dart';
import '../../../providers/todos/todos_provider.dart';
import 'todo_list_item_view.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(todosProvider(isCompleted: false)).when(
          data: (todos) {
            final items = todos.map(SavedTodo.from).map(TodoListItemView.new);
            return ListView.builder(
              itemBuilder: (_, index) => items.elementAt(index),
              itemCount: items.length,
            );
          },
          error: (_, __) => const Center(
            child: Text('Something went wrong...'),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
