import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/date_time_format.dart';
import '../../../entities/unsaved_todo.dart';
import '../../../providers/todo/draft_todo_provider.dart';

class TodoInputBottomSheet extends StatelessWidget {
  const TodoInputBottomSheet({
    Key? key,
    this.initialData = const UnsavedTodo(),
  }) : super(key: key);

  final UnsavedTodo initialData;

  DraftTodoProvider get _draftTodoProvider => draftTodoProvider(initialData);

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
        child: _buildInputForm(context),
      ),
    );
  }

  Widget _buildInputForm(BuildContext context) => Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (_, ref, __) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  initialValue: ref.watch(_draftTodoProvider).contents,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.description),
                    hintText: '新しいタスクを追加しましょう',
                  ),
                  autofocus: true,
                  maxLines: null,
                  onChanged:
                      ref.read(_draftTodoProvider.notifier).onContentsChanged,
                  validator: (_) =>
                      ref.read(_draftTodoProvider).failureOrContents.fold(
                            (failure) => failure.message,
                            (_) => null,
                          ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Consumer(
              builder: (_, ref, __) {
                final deadline = ref.watch(_draftTodoProvider).deadline;
                return TextButton.icon(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    ref
                        .read(_draftTodoProvider.notifier)
                        .selectDeadline(selectedDate);
                  },
                  icon: const Icon(Icons.today),
                  label: Text(
                    deadline == null
                        ? '日付を選択してください'
                        : deadline.toMMMEdHmString(),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('キャンセル'),
                ),
                const SizedBox(width: 12),
                Consumer(
                  builder: (_, ref, __) => ElevatedButton(
                    onPressed: ref.watch(_draftTodoProvider).isValid
                        ? () => _save(context, ref)
                        : null,
                    child: const Text('保存'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Future<void> _save(BuildContext context, WidgetRef ref) async {
    await ref.read(_draftTodoProvider.notifier).save();
    if (context.mounted) {
      Navigator.pop(context);
    }
  }
}
