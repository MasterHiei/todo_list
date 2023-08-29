import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../collections/todo.dart';

part 'saved_todo.freezed.dart';

@freezed
class SavedTodo with _$SavedTodo {
  const factory SavedTodo({
    required Id id,
    required String contents,
    required DateTime deadline,
    required bool isCompleted,
  }) = _SavedTodo;

  factory SavedTodo.from(Todo todo) => SavedTodo(
        id: todo.id,
        contents: todo.contents,
        deadline: todo.deadline,
        isCompleted: todo.isCompleted,
      );

  const SavedTodo._();

  Todo toCollection() => Todo()
    ..id = id
    ..contents = contents
    ..deadline = deadline
    ..isCompleted = isCompleted;
}
