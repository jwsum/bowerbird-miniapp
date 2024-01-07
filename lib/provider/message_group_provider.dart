import 'package:bowerbird_miniapp/main.dart';
import 'package:bowerbird_miniapp/model/message_group.dart';
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
