import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/collections/todo.dart';
import '../../services/todos_service.dart';

part 'todos_provider.g.dart';

@riverpod
Stream<List<Todo>> todos(TodosRef ref, {required bool isCompleted}) =>
    ref.watch(todosServiceProvider).watch(isCompleted: isCompleted);
