import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/todos_provider.dart';
import 'todo_list_item_view.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    final items = todos.map(TodoListItemView.new).toList();
    return ListView.builder(
      itemBuilder: (_, index) => items[index],
      itemCount: items.length,
    );
  }
}
