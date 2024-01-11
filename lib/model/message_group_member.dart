import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'message_group_member.freezed.dart';

part 'message_group_member.g.dart';

@freezed
class MessageGroupMember with _$MessageGroupMember {
  const factory MessageGroupMember({
    required String id,
    @JsonKey(name: "message_group_id") required String messageGroupId,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: 'user_name') String? username,
  }) = _MessageGroupMember;

  factory MessageGroupMember.fromJson(Map<String, Object?> json) =>
      _$MessageGroupMemberFromJson(json);
}
