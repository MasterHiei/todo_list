import 'package:flutter/material.dart';

import 'widgets/index.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppBar(),
      body: const TodoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTodoBottomSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showCreateTodoBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => const CreateTodoBottomSheet(),
        isScrollControlled: true,
        isDismissible: false,
      );
}
