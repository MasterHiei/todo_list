import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/create_todo_provider.dart';
import '../providers/todos_provider.dart';

class CreateTodoBottomSheet extends StatelessWidget {
  const CreateTodoBottomSheet({super.key});

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
            Consumer(
              builder: (_, ref, __) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: ref
                        .watch(createTodoProvider.notifier)
                        .contentsController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.description),
                      hintText: '新しいタスクを追加しましょう。',
                    ),
                    autofocus: true,
                  ),
                );
              },
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
                    onPressed: () =>
                        ref.read(todosProvider.notifier).add(context),
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
}
