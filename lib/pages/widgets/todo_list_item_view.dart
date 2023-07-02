import 'package:flutter/material.dart';

import '../../collections/todo.dart';
import '../../core/failures/extensions/date_time_format.dart';
import '../../entities/unsaved_todo.dart';
import 'todo_input_bottom_sheet.dart';

class TodoListItemView extends StatelessWidget {
  const TodoListItemView(this.data, {super.key});

  final Todo data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        onChanged: (_) {},
        value: data.isCompleted,
      ),
      title: Text(data.contents),
      subtitle: Text(data.deadline.toMMMEdHmString()),
      onTap: () => _showModifyTodoBottomSheet(context),
    );
  }

  Future<void> _showModifyTodoBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => TodoInputBottomSheet(
          initialData: UnsavedTodo.fromSaved(data),
        ),
        isScrollControlled: true,
        isDismissible: false,
      );
}
