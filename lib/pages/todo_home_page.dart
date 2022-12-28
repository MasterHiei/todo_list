import 'package:flutter/material.dart';

import '../components/index.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({Key? key}) : super(key: key);

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final _todoListViewKey = GlobalKey<TodoListViewState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppBar(),
      body: TodoListView(key: _todoListViewKey),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => CreateTodoBottomSheet(
              todoListViewKey: _todoListViewKey,
            ),
            isScrollControlled: true,
            isDismissible: false,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
