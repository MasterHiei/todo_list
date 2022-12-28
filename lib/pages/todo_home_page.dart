import 'package:flutter/material.dart';

import '../components/index.dart';

class TodoHomePage extends StatelessWidget {
  TodoHomePage({super.key});

  final _todoListViewKey = GlobalKey<TodoListViewState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppBar(),
      body: TodoListView(key: _todoListViewKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTodoBottomSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showCreateTodoBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => CreateTodoBottomSheet(
          todoListViewKey: _todoListViewKey,
        ),
        isScrollControlled: true,
        isDismissible: false,
      );
}
