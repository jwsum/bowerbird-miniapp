// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageGroupImpl _$$MessageGroupImplFromJson(Map<String, dynamic> json) =>
    _$MessageGroupImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      userId: json['user_id'] as String?,
      lastMessageAt: json['last_message_at'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$MessageGroupImplToJson(_$MessageGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'last_message_at': instance.lastMessageAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
