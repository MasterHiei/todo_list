import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failures/extensions/date_time_format.dart';
import '../../entities/saved_todo.dart';
import '../../entities/unsaved_todo.dart';
import '../../providers/todo/payload_todo_provider.dart';
import 'todo_input_bottom_sheet.dart';

class TodoListItemView extends ConsumerWidget {
  const TodoListItemView(this.data, {super.key});

  final SavedTodo data;

  PayloadTodoProvider get _payloadTodoProvider => payloadTodoProvider(data);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.green,
        child: const Icon(Icons.check, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        switch (direction) {
          case DismissDirection.endToStart:
            return true;

          case DismissDirection.startToEnd:
            return await _showConfirmRemoveBottomSheet(context);

          default:
            return false;
        }
      },
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.endToStart:
            break;

          case DismissDirection.startToEnd:
            _remove(ref);

          default:
            break;
        }
      },
      child: _buildItem(context),
    );
  }

  Widget _buildItem(BuildContext context) => ListTile(
        leading: Checkbox(
          onChanged: (_) {},
          value: data.isCompleted,
        ),
        title: Text(data.contents),
        subtitle: Text(data.deadline.toMMMEdHmString()),
        onTap: () => _showModifyBottomSheet(context),
      );

  Future<bool?> _showConfirmRemoveBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              style: TextButton.styleFrom(
                foregroundColor: Colors.amber,
                backgroundColor: Colors.red,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  '削除',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      );

  Future<void> _showModifyBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => TodoInputBottomSheet(
          initialData: UnsavedTodo.from(data),
        ),
        isScrollControlled: true,
        isDismissible: false,
      );

  void _remove(WidgetRef ref) =>
      ref.read(_payloadTodoProvider.notifier).remove();
}
