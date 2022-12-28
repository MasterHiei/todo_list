import 'package:flutter/material.dart';

import '../models/todo_item.dart';

class TodoListItemView extends StatelessWidget {
  const TodoListItemView(this.data, {super.key});

  final TodoItem data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: (_) {},
        value: data.isCompleted,
      ),
      title: Text(data.contents),
      subtitle: Text(data.date.toString()),
      onTap: () {
        debugPrint('33333');
      },
    );
  }
}
