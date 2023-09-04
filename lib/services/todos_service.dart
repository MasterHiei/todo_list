import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/collections/todo.dart';
import 'clients/isar_provider.dart';

part 'todos_service.g.dart';

@riverpod
TodosService todosService(TodosServiceRef ref) => TodosService(ref);

abstract class ITodosService {
  Stream<List<Todo>> watch({required bool isCompleted});

  Future<void> insertOrUpdate(Todo todo);

  Future<void> delete(Todo todo);

  Future<void> deleteAll(List<Id> ids);
}

class TodosService implements ITodosService {
  const TodosService(this.ref);

  final TodosServiceRef ref;

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
  Future<void> delete(Todo todo) =>
      _isar.writeTxn(() => _isar.todos.delete(todo.id));

  @override
  Future<void> deleteAll(List<Id> ids) =>
      _isar.writeTxn(() => _isar.todos.deleteAll(ids));
}
