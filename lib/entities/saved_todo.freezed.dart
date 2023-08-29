// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SavedTodo {
  int get id => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  DateTime get deadline => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedTodoCopyWith<SavedTodo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedTodoCopyWith<$Res> {
  factory $SavedTodoCopyWith(SavedTodo value, $Res Function(SavedTodo) then) =
      _$SavedTodoCopyWithImpl<$Res, SavedTodo>;
  @useResult
  $Res call({int id, String contents, DateTime deadline, bool isCompleted});
}

/// @nodoc
class _$SavedTodoCopyWithImpl<$Res, $Val extends SavedTodo>
    implements $SavedTodoCopyWith<$Res> {
  _$SavedTodoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contents = null,
    Object? deadline = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedTodoCopyWith<$Res> implements $SavedTodoCopyWith<$Res> {
  factory _$$_SavedTodoCopyWith(
          _$_SavedTodo value, $Res Function(_$_SavedTodo) then) =
      __$$_SavedTodoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String contents, DateTime deadline, bool isCompleted});
}

/// @nodoc
class __$$_SavedTodoCopyWithImpl<$Res>
    extends _$SavedTodoCopyWithImpl<$Res, _$_SavedTodo>
    implements _$$_SavedTodoCopyWith<$Res> {
  __$$_SavedTodoCopyWithImpl(
      _$_SavedTodo _value, $Res Function(_$_SavedTodo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contents = null,
    Object? deadline = null,
    Object? isCompleted = null,
  }) {
    return _then(_$_SavedTodo(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SavedTodo extends _SavedTodo {
  const _$_SavedTodo(
      {required this.id,
      required this.contents,
      required this.deadline,
      required this.isCompleted})
      : super._();

  @override
  final int id;
  @override
  final String contents;
  @override
  final DateTime deadline;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'SavedTodo(id: $id, contents: $contents, deadline: $deadline, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedTodo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, contents, deadline, isCompleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedTodoCopyWith<_$_SavedTodo> get copyWith =>
      __$$_SavedTodoCopyWithImpl<_$_SavedTodo>(this, _$identity);
}

abstract class _SavedTodo extends SavedTodo {
  const factory _SavedTodo(
      {required final int id,
      required final String contents,
      required final DateTime deadline,
      required final bool isCompleted}) = _$_SavedTodo;
  const _SavedTodo._() : super._();

  @override
  int get id;
  @override
  String get contents;
  @override
  DateTime get deadline;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_SavedTodoCopyWith<_$_SavedTodo> get copyWith =>
      throw _privateConstructorUsedError;
}
