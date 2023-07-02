import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../collections/todo.dart';
import '../services/todos_service.dart';

part 'incomplete_todos_provider.g.dart';

@riverpod
Future<List<Todo>> incompleteTodos(IncompleteTodosRef ref) =>
    ref.watch(todosServiceProvider.notifier).findAll();
