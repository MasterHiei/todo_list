import 'package:flutter/material.dart';

import '../models/todo_item.dart';
import 'todo_list_item_view.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => TodoListViewState();
}

class TodoListViewState extends State<TodoListView> {
  final _todos = <TodoItem>[];

  @override
  Widget build(BuildContext context) {
    final items = _todos.map(TodoListItemView.new).toList();
    return ListView.builder(
      itemBuilder: (_, index) => items[index],
      itemCount: items.length,
    );
  }

  void add(TodoItem todo) => setState(() => _todos.add(todo));
}
