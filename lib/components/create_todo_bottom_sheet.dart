import 'package:flutter/material.dart';

import '../models/todo_item.dart';
import 'todo_list_view.dart';

class CreateTodoBottomSheet extends StatefulWidget {
  const CreateTodoBottomSheet({
    super.key,
    required this.todoListViewKey,
  });

  final GlobalKey<TodoListViewState> todoListViewKey;

  @override
  State<CreateTodoBottomSheet> createState() => _CreateTodoBottomSheetState();
}

class _CreateTodoBottomSheetState extends State<CreateTodoBottomSheet> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: '新しいタスクを追加しましょう。',
                ),
                autofocus: true,
              ),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.today),
              label: Text(DateTime.now().toString()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _onCreate,
                  child: const Text('追加'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('キャンセル'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onCreate() {
    final contents = _controller.text;
    if (contents.isEmpty) {
      return;
    }
    final todo = TodoItem(
      contents: contents,
      date: DateTime.now(),
    );
    widget.todoListViewKey.currentState?.add(todo);
    _controller.clear();
    Navigator.pop(context);
  }
}
