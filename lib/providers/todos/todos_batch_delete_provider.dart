import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/todos_service.dart';
import 'states/todos_batch_delete_state.dart';

part 'todos_batch_delete_provider.g.dart';

final batchDeleteEnabledProvider = Provider.autoDispose(
  (ref) => ref.watch(
    todosBatchDeleteProvider.select((state) => state.enabled),
  ),
);

@riverpod
class TodosBatchDelete extends _$TodosBatchDelete {
  @override
  TodosBatchDeleteState build() => TodosBatchDeleteState.disabled();

  void enable() => state = TodosBatchDeleteState.enabled();

  void disbale() => state = TodosBatchDeleteState.disabled();

  void check(Id id) {
    final checkedIds = [...state.checkedIds];
    state.isChecked(id) ? checkedIds.remove(id) : checkedIds.add(id);
    state = state.copyWith(checkedIds: checkedIds);
  }

  Future<void> execute() =>
      ref.watch(todosServiceProvider).deleteAll(state.checkedIds);
}
