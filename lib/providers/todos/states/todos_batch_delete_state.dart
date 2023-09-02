import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'todos_batch_delete_state.freezed.dart';

@freezed
class TodosBatchDeleteState with _$TodosBatchDeleteState {
  const factory TodosBatchDeleteState({
    required bool enabled,
    @Default([]) List<Id> checkedIds,
  }) = _TodosBatchDeleteState;

  factory TodosBatchDeleteState.enabled() =>
      const TodosBatchDeleteState(enabled: true);

  factory TodosBatchDeleteState.disabled() =>
      const TodosBatchDeleteState(enabled: false);

  const TodosBatchDeleteState._();

  bool isChecked(Id id) => checkedIds.contains(id);
}
