import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/todo_item.dart';

part 'todos_provider.g.dart';

@riverpod
class Todos extends _$Todos {
  @override
  List<TodoItem> build() => [];

  void add(
    BuildContext context,
    TextEditingController contentsController,
  ) {
    final contents = contentsController.text;
    if (contents.isEmpty) {
      return;
    }
    final todo = TodoItem(
      contents: contents,
      date: DateTime.now(),
    );
    state = [...state, todo];
    contentsController.clear();
    Navigator.pop(context);
  }
}
