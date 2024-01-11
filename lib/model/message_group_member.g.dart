// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_group_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageGroupMemberImpl _$$MessageGroupMemberImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageGroupMemberImpl(
      id: json['id'] as String,
      messageGroupId: json['message_group_id'] as String,
      userId: json['user_id'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      username: json['user_name'] as String?,
    );

Map<String, dynamic> _$$MessageGroupMemberImplToJson(
        _$MessageGroupMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message_group_id': instance.messageGroupId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_name': instance.username,
    };
