// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_group_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageGroupMember _$MessageGroupMemberFromJson(Map<String, dynamic> json) {
  return _MessageGroupMember.fromJson(json);
}

/// @nodoc
mixin _$MessageGroupMember {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "message_group_id")
  String get messageGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageGroupMemberCopyWith<MessageGroupMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageGroupMemberCopyWith<$Res> {
  factory $MessageGroupMemberCopyWith(
          MessageGroupMember value, $Res Function(MessageGroupMember) then) =
      _$MessageGroupMemberCopyWithImpl<$Res, MessageGroupMember>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "message_group_id") String messageGroupId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: 'user_name') String? username});
}

/// @nodoc
class _$MessageGroupMemberCopyWithImpl<$Res, $Val extends MessageGroupMember>
    implements $MessageGroupMemberCopyWith<$Res> {
  _$MessageGroupMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageGroupId = null,
    Object? userId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageGroupId: null == messageGroupId
          ? _value.messageGroupId
          : messageGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageGroupMemberImplCopyWith<$Res>
    implements $MessageGroupMemberCopyWith<$Res> {
  factory _$$MessageGroupMemberImplCopyWith(_$MessageGroupMemberImpl value,
          $Res Function(_$MessageGroupMemberImpl) then) =
      __$$MessageGroupMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "message_group_id") String messageGroupId,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: 'user_name') String? username});
}

/// @nodoc
class __$$MessageGroupMemberImplCopyWithImpl<$Res>
    extends _$MessageGroupMemberCopyWithImpl<$Res, _$MessageGroupMemberImpl>
    implements _$$MessageGroupMemberImplCopyWith<$Res> {
  __$$MessageGroupMemberImplCopyWithImpl(_$MessageGroupMemberImpl _value,
      $Res Function(_$MessageGroupMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? messageGroupId = null,
    Object? userId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? username = freezed,
  }) {
    return _then(_$MessageGroupMemberImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      messageGroupId: null == messageGroupId
          ? _value.messageGroupId
          : messageGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageGroupMemberImpl
    with DiagnosticableTreeMixin
    implements _MessageGroupMember {
  const _$MessageGroupMemberImpl(
      {required this.id,
      @JsonKey(name: "message_group_id") required this.messageGroupId,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: 'user_name') this.username});

  factory _$MessageGroupMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageGroupMemberImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "message_group_id")
  final String messageGroupId;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: 'user_name')
  final String? username;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageGroupMember(id: $id, messageGroupId: $messageGroupId, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt, username: $username)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageGroupMember'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('messageGroupId', messageGroupId))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('username', username));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageGroupMemberImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.messageGroupId, messageGroupId) ||
                other.messageGroupId == messageGroupId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, messageGroupId, userId, createdAt, updatedAt, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageGroupMemberImplCopyWith<_$MessageGroupMemberImpl> get copyWith =>
      __$$MessageGroupMemberImplCopyWithImpl<_$MessageGroupMemberImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageGroupMemberImplToJson(
      this,
    );
  }
}

abstract class _MessageGroupMember implements MessageGroupMember {
  const factory _MessageGroupMember(
      {required final String id,
      @JsonKey(name: "message_group_id") required final String messageGroupId,
      @JsonKey(name: "user_id") final String? userId,
      @JsonKey(name: "created_at") required final String createdAt,
      @JsonKey(name: "updated_at") required final String updatedAt,
      @JsonKey(name: 'user_name')
      final String? username}) = _$MessageGroupMemberImpl;

  factory _MessageGroupMember.fromJson(Map<String, dynamic> json) =
      _$MessageGroupMemberImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "message_group_id")
  String get messageGroupId;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: 'user_name')
  String? get username;
  @override
  @JsonKey(ignore: true)
  _$$MessageGroupMemberImplCopyWith<_$MessageGroupMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
