import 'package:either_dart/either.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

import '../collections/todo.dart';
import '../../core/failures/value_failure.dart';
import 'saved_todo.dart';

part 'unsaved_todo.freezed.dart';

@freezed
class UnsavedTodo with _$UnsavedTodo {
  const factory UnsavedTodo({
    Id? id,
    @Default('') String contents,
    DateTime? deadline,
  }) = _UnsavedTodo;

  factory UnsavedTodo.from(SavedTodo todo) => UnsavedTodo(
        id: todo.id,
        contents: todo.contents,
        deadline: todo.deadline,
      );

  const UnsavedTodo._();

  bool get isValid => failureOrContents.isRight && failureOrDeadline.isRight;

  String? get errorMessage => failureOrContents.fold(
        (failure) => failure.message,
        (_) => null,
      );

  Either<ValueFailure, String> get failureOrContents {
    if (contents.isEmpty) {
      return const Left(ValueFailure.empty());
    }
    return Right(contents);
  }

  Either<ValueFailure, DateTime> get failureOrDeadline {
    if (deadline == null) {
      return const Left(ValueFailure.empty());
    }
    return Right(deadline!);
  }

  Todo toCollection() {
    assert(deadline != null);

    final collection = Todo();
    if (id != null) {
      collection.id = id!;
    }
    return collection
      ..contents = contents
      ..deadline = deadline!;
  }
}
