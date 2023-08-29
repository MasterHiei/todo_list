import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/saved_todo.dart';
import '../../services/todos_service.dart';

part 'payload_todo_provider.g.dart';

@riverpod
class PayloadTodo extends _$PayloadTodo {
  @override
  SavedTodo build(SavedTodo target) => target;

  Future<void> complete() => ref
      .read(todosServiceProvider.notifier)
      .insertOrUpdate(state.toCollection()..isCompleted = true);

  Future<void> remove() =>
      ref.read(todosServiceProvider.notifier).remove(state.toCollection());
}
