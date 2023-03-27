import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/todo_item.dart';
import '../providers/todos_provider.dart';

class CreateTodoBottomSheet extends StatefulWidget {
  const CreateTodoBottomSheet({super.key});

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
                Consumer(
                  builder: (_, ref, __) => ElevatedButton(
                    onPressed: () => _onCreate(ref),
                    child: const Text('追加'),
                  ),
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

  void _onCreate(WidgetRef ref) {
    final contents = _controller.text;
    if (contents.isEmpty) {
      return;
    }
    final todo = TodoItem(
      contents: contents,
      date: DateTime.now(),
    );
    ref.read(todosProvider.notifier).add(todo);
    _controller.clear();
    Navigator.pop(context);
  }
}
