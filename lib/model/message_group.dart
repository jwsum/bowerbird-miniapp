import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'message_group.freezed.dart';

part 'message_group.g.dart';

@freezed
class MessageGroup with _$MessageGroup {
  const factory MessageGroup({
    required String id,
    required String name,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "last_message_at") String? lastMessageAt,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
  }) = _MessageGroup;

  factory MessageGroup.fromJson(Map<String, Object?> json) =>
      _$MessageGroupFromJson(json);
}
