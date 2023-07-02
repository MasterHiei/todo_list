import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/unsaved_todo.dart';
import '../../services/todos_service.dart';
import '../incomplete_todos_provider.dart';

part 'todo_provider.g.dart';

@riverpod
class Todo extends _$Todo {
  @override
  UnsavedTodo build(UnsavedTodo initialValue) => initialValue;

  TodosService get _service => ref.watch(todosServiceProvider.notifier);

  void onContentsChanged(String contents) =>
      state = state.copyWith(contents: contents);

  void selectDeadline(DateTime? deadline) {
    if (deadline == null) {
      return;
    }
    state = state.copyWith(deadline: deadline);
  }

  Future<void> save() async {
    if (!state.isValid) {
      return;
    }
    await _service.insertOrUpdate(state.toCollection());

    ref.invalidate(incompleteTodosProvider);
  }
}
