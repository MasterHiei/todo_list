// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unsaved_todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UnsavedTodo {
  int? get id => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnsavedTodoCopyWith<UnsavedTodo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnsavedTodoCopyWith<$Res> {
  factory $UnsavedTodoCopyWith(
          UnsavedTodo value, $Res Function(UnsavedTodo) then) =
      _$UnsavedTodoCopyWithImpl<$Res, UnsavedTodo>;
  @useResult
  $Res call({int? id, String contents, DateTime? deadline});
}

/// @nodoc
class _$UnsavedTodoCopyWithImpl<$Res, $Val extends UnsavedTodo>
    implements $UnsavedTodoCopyWith<$Res> {
  _$UnsavedTodoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contents = null,
    Object? deadline = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnsavedTodoCopyWith<$Res>
    implements $UnsavedTodoCopyWith<$Res> {
  factory _$$_UnsavedTodoCopyWith(
          _$_UnsavedTodo value, $Res Function(_$_UnsavedTodo) then) =
      __$$_UnsavedTodoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String contents, DateTime? deadline});
}

/// @nodoc
class __$$_UnsavedTodoCopyWithImpl<$Res>
    extends _$UnsavedTodoCopyWithImpl<$Res, _$_UnsavedTodo>
    implements _$$_UnsavedTodoCopyWith<$Res> {
  __$$_UnsavedTodoCopyWithImpl(
      _$_UnsavedTodo _value, $Res Function(_$_UnsavedTodo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contents = null,
    Object? deadline = freezed,
  }) {
    return _then(_$_UnsavedTodo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_UnsavedTodo extends _UnsavedTodo {
  const _$_UnsavedTodo({this.id, this.contents = '', this.deadline})
      : super._();

  @override
  final int? id;
  @override
  @JsonKey()
  final String contents;
  @override
  final DateTime? deadline;

  @override
  String toString() {
    return 'UnsavedTodo(id: $id, contents: $contents, deadline: $deadline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnsavedTodo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, contents, deadline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnsavedTodoCopyWith<_$_UnsavedTodo> get copyWith =>
      __$$_UnsavedTodoCopyWithImpl<_$_UnsavedTodo>(this, _$identity);
}

abstract class _UnsavedTodo extends UnsavedTodo {
  const factory _UnsavedTodo(
      {final int? id,
      final String contents,
      final DateTime? deadline}) = _$_UnsavedTodo;
  const _UnsavedTodo._() : super._();

  @override
  int? get id;
  @override
  String get contents;
  @override
  DateTime? get deadline;
  @override
  @JsonKey(ignore: true)
  _$$_UnsavedTodoCopyWith<_$_UnsavedTodo> get copyWith =>
      throw _privateConstructorUsedError;
}
