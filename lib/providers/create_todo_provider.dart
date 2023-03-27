import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_todo_provider.g.dart';

@riverpod
class CreateTodo extends _$CreateTodo {
  @override
  void build() {
    ref.onDispose(() {
      contentsController.dispose();
    });
    return;
  }

  final contentsController = TextEditingController();

  String get contents => contentsController.text;

  void clear() {
    contentsController.clear();
  }
}
