import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../collections/todo.dart';
import 'clients/isar_provider.dart';

part 'todos_service.g.dart';

abstract class ITodosService {
  Stream<List<Todo>> watch({required bool isCompleted});

  Future<void> insertOrUpdate(Todo todo);

  Future<void> remove(Todo todo);
}

@riverpod
class TodosService extends _$TodosService implements ITodosService {
  @override
  void build() {}

  Isar get _isar => ref.watch(isarProvider);

  @override
  Stream<List<Todo>> watch({required bool isCompleted}) => _isar.todos
      .filter()
      .isCompletedEqualTo(isCompleted)
      .sortByDeadline()
      .build()
      .watch(fireImmediately: true);

  @override
  Future<void> insertOrUpdate(Todo todo) =>
      _isar.writeTxn(() => _isar.todos.put(todo));

  @override
  Future<void> remove(Todo todo) =>
      _isar.writeTxn(() => _isar.todos.delete(todo.id));
}
