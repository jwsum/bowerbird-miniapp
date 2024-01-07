// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageGroup _$MessageGroupFromJson(Map<String, dynamic> json) {
  return _MessageGroup.fromJson(json);
}

/// @nodoc
mixin _$MessageGroup {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "last_message_at")
  String? get lastMessageAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageGroupCopyWith<MessageGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageGroupCopyWith<$Res> {
  factory $MessageGroupCopyWith(
          MessageGroup value, $Res Function(MessageGroup) then) =
      _$MessageGroupCopyWithImpl<$Res, MessageGroup>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "last_message_at") String? lastMessageAt,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class _$MessageGroupCopyWithImpl<$Res, $Val extends MessageGroup>
    implements $MessageGroupCopyWith<$Res> {
  _$MessageGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = freezed,
    Object? lastMessageAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _value.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageGroupImplCopyWith<$Res>
    implements $MessageGroupCopyWith<$Res> {
  factory _$$MessageGroupImplCopyWith(
          _$MessageGroupImpl value, $Res Function(_$MessageGroupImpl) then) =
      __$$MessageGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "last_message_at") String? lastMessageAt,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class __$$MessageGroupImplCopyWithImpl<$Res>
    extends _$MessageGroupCopyWithImpl<$Res, _$MessageGroupImpl>
    implements _$$MessageGroupImplCopyWith<$Res> {
  __$$MessageGroupImplCopyWithImpl(
      _$MessageGroupImpl _value, $Res Function(_$MessageGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userId = freezed,
    Object? lastMessageAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$MessageGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessageAt: freezed == lastMessageAt
          ? _value.lastMessageAt
          : lastMessageAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageGroupImpl with DiagnosticableTreeMixin implements _MessageGroup {
  const _$MessageGroupImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "last_message_at") this.lastMessageAt,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt});

  factory _$MessageGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageGroupImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "last_message_at")
  final String? lastMessageAt;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageGroup(id: $id, name: $name, userId: $userId, lastMessageAt: $lastMessageAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageGroup'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('lastMessageAt', lastMessageAt))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, userId, lastMessageAt, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageGroupImplCopyWith<_$MessageGroupImpl> get copyWith =>
      __$$MessageGroupImplCopyWithImpl<_$MessageGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageGroupImplToJson(
      this,
    );
  }
}

abstract class _MessageGroup implements MessageGroup {
  const factory _MessageGroup(
          {required final String id,
          required final String name,
          @JsonKey(name: "user_id") final String? userId,
          @JsonKey(name: "last_message_at") final String? lastMessageAt,
          @JsonKey(name: "created_at") required final String createdAt,
          @JsonKey(name: "updated_at") required final String updatedAt}) =
      _$MessageGroupImpl;

  factory _MessageGroup.fromJson(Map<String, dynamic> json) =
      _$MessageGroupImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "last_message_at")
  String? get lastMessageAt;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$MessageGroupImplCopyWith<_$MessageGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
