import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/todo_item.dart';

part 'todos_provider.g.dart';

@riverpod
class Todos extends _$Todos {
  @override
  List<TodoItem> build() => [];

  void add(TodoItem todo) => state = [...state, todo];
}
