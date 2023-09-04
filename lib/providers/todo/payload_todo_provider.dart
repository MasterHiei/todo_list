import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/entities/saved_todo.dart';
import '../../services/todos_service.dart';

part 'payload_todo_provider.g.dart';

@riverpod
class PayloadTodo extends _$PayloadTodo {
  @override
  SavedTodo build(SavedTodo target) => target;

  Future<void> complete() => ref
      .read(todosServiceProvider)
      .insertOrUpdate(state.toCollection()..isCompleted = true);

  Future<void> delete() =>
      ref.read(todosServiceProvider).delete(state.toCollection());
}
