import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/extensions/date_time_format.dart';
import '../../../entities/saved_todo.dart';
import '../../../entities/unsaved_todo.dart';
import '../../../providers/todo/payload_todo_provider.dart';
import '../../../providers/todos/todos_batch_delete_provider.dart';
import '../../widgets/index.dart';
import 'index.dart';

class TodoListItemView extends ConsumerWidget {
  const TodoListItemView(this.data, {super.key});

  final SavedTodo data;

  PayloadTodoProvider get _payloadTodoProvider => payloadTodoProvider(data);

  ProviderListenable<bool> get _batchDeleteEnabled =>
      todosBatchDeleteProvider.select((state) => state.enabled);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(data.id),
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
            return await _showConfirmDeleteBottomSheet(context);

          default:
            return false;
        }
      },
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.endToStart:
            _complete(ref);

          case DismissDirection.startToEnd:
            _delete(ref);

          default:
            break;
        }
      },
      direction: ref.watch(_batchDeleteEnabled)
          ? DismissDirection.none
          : DismissDirection.horizontal,
      child: _buildItem(context),
    );
  }

  Widget _buildItem(BuildContext context) => Consumer(
        builder: (_, ref, __) => ListTile(
          leading: ref.watch(_batchDeleteEnabled)
              ? Consumer(
                  builder: (_, ref, __) {
                    return Checkbox(
                      onChanged: (_) {},
                      value: ref.watch(
                        todosBatchDeleteProvider.select(
                          (state) => state.isChecked(data.id),
                        ),
                      ),
                    );
                  },
                )
              : null,
          title: Text(data.contents),
          subtitle: Text(data.deadline.toMMMEdHmString()),
          onTap: () => ref.watch(_batchDeleteEnabled)
              ? ref.read(todosBatchDeleteProvider.notifier).check(data.id)
              : _showModifyBottomSheet(context),
          onLongPress: ref.watch(_batchDeleteEnabled)
              ? null
              : ref.read(todosBatchDeleteProvider.notifier).enable,
        ),
      );

  Future<bool?> _showConfirmDeleteBottomSheet(BuildContext context) =>
      showModalBottomSheet(
        context: context,
        builder: (_) => const TodoConfirmDeleteBottomSheet(),
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

  Future<void> _complete(WidgetRef ref) =>
      ref.read(_payloadTodoProvider.notifier).complete();

  Future<void> _delete(WidgetRef ref) =>
      ref.read(_payloadTodoProvider.notifier).delete();
}
