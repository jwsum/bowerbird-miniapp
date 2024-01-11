import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'message.freezed.dart';

part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    @JsonKey(name: "message_group_id") required String messageGroupId,
    @JsonKey(name: "message_group_member_id")
    required String messageGroupMemberId,
    @JsonKey(name: "user_id") String? userId,
    required String message,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: 'user_name') String? username,
  }) = _Message;

  factory Message.fromJson(Map<String, Object?> json) =>
      _$MessageFromJson(json);
}
