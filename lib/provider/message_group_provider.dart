import 'package:bowerbird_miniapp/main.dart';
import 'package:bowerbird_miniapp/model/message.dart';
import 'package:bowerbird_miniapp/model/message_group.dart';
import 'package:bowerbird_miniapp/model/message_group_member.dart';
import 'package:bowerbird_miniapp/provider/auth_provider.dart';
import 'package:bowerbird_miniapp/provider/shared_pref_provider.dart';
import 'package:bowerbird_miniapp/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ScaffoldMessengerState? scaffoldMessengerState =
    scaffoldMessengerKey.currentState;

final messageGroupProvider =
    FutureProvider.autoDispose<List<MessageGroup>>((ref) async {
  final repo = ref.read(repositoryProvider);
  String? token = ref.watch(sharedUtilityProvider).getToken();

  final response = await repo.getMessageGroup(token!);

  if (response is List) {
    return response
        .map<MessageGroup>(
            (messageGroup) => MessageGroup.fromJson(messageGroup))
        .toList();
  } else if (response is Response) {
    if (response.statusCode == 401) {
      var result = response.data;
      scaffoldMessengerState
          ?.showSnackBar(SnackBar(content: Text(result['message'] ?? "")));
      ref.read(loginProvider.notifier).logout();
    }
    return [];
  } else {
    return [];
  }
});

final messageGroupMemberProvider = AsyncNotifierProvider.autoDispose
    .family<MessageGroupMemberNotifier, List<MessageGroupMember>, String>(
  MessageGroupMemberNotifier.new,
);

class MessageGroupMemberNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<MessageGroupMember>, String> {
  @override
  Future<List<MessageGroupMember>> build(String arg) async {
    final repo = ref.read(repositoryProvider);
    String? token = ref.watch(sharedUtilityProvider).getToken();

    final response = await repo.getMessageGroupMember(token!, arg);
    if (response is List) {
      return response
          .map<MessageGroupMember>((messageGroupMember) =>
              MessageGroupMember.fromJson(messageGroupMember))
          .toList();
    } else if (response is Response) {
      if (response.statusCode == 401) {
        var result = response.data;
        scaffoldMessengerState
            ?.showSnackBar(SnackBar(content: Text(result['message'] ?? "")));
        ref.read(loginProvider.notifier).logout();
      }
      return [];
    } else {
      return [];
    }
  }
}

final messageProvider = AsyncNotifierProvider.autoDispose
    .family<MessageNotifier, List<Message>, String>(
  MessageNotifier.new,
);

class MessageNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Message>, String> {
  @override
  Future<List<Message>> build(String arg) async {
    final repo = ref.read(repositoryProvider);
    String? token = ref.watch(sharedUtilityProvider).getToken();

    final response = await repo.getMessage(token!, arg);

    if (response is List) {
      return response
          .map<Message>((message) => Message.fromJson(message))
          .toList();
    } else if (response is Response) {
      if (response.statusCode == 401) {
        var result = response.data;
        scaffoldMessengerState
            ?.showSnackBar(SnackBar(content: Text(result['message'] ?? "")));
        ref.read(loginProvider.notifier).logout();
      }
      return [];
    } else {
      return [];
    }
  }

  Future<void> sendMessage(
      {required String messageGroupId,
      required String messageGroupMemberId,
      required String message}) async {
    final repo = ref.read(repositoryProvider);
    String? token = ref.watch(sharedUtilityProvider).getToken();
    await repo.sendMessage(
        token!, messageGroupId, messageGroupMemberId, message);

    ref.invalidateSelf();
    await future;
  }

  Future<void> refreshMessage() async {
    ref.invalidateSelf();
    await future;
  }
}
