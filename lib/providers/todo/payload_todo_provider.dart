import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/saved_todo.dart';
import '../../services/todos_service.dart';
import '../incomplete_todos_provider.dart';

part 'payload_todo_provider.g.dart';

@riverpod
class PayloadTodo extends _$PayloadTodo {
  @override
  SavedTodo build(SavedTodo target) => target;

  Future<void> remove() async {
    await ref.read(todosServiceProvider.notifier).remove(state.toCollection());
    ref.invalidate(incompleteTodosProvider);
  }
}
