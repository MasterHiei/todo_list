import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/todo_item.dart';
import 'create_todo_provider.dart';

part 'todos_provider.g.dart';

@riverpod
class Todos extends _$Todos {
  @override
  List<TodoItem> build() => [];

  void add(BuildContext context) {
    final contents = ref.watch(createTodoProvider.notifier).contents;
    if (contents.isEmpty) {
      return;
    }
    final todo = TodoItem(
      contents: contents,
      date: DateTime.now(),
    );
    state = [...state, todo];
    ref.watch(createTodoProvider.notifier).clear();
    Navigator.pop(context);
  }
}
