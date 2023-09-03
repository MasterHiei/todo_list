import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/unsaved_todo.dart';
import '../../services/todos_service.dart';

part 'draft_todo_provider.g.dart';

@riverpod
class DraftTodo extends _$DraftTodo {
  @override
  UnsavedTodo build(UnsavedTodo initialValue) => initialValue;

  TodosService get _service => ref.watch(todosServiceProvider);

  void onContentsChanged(String contents) =>
      state = state.copyWith(contents: contents);

  void setDeadline(DateTime? deadline) {
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
  }
}
