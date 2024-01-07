import 'package:bowerbird_miniapp/main.dart';
import 'package:bowerbird_miniapp/provider/shared_pref_provider.dart';
import 'package:bowerbird_miniapp/repository.dart';
import 'package:bowerbird_miniapp/util/enum.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

ScaffoldMessengerState? scaffoldMessengerState =
    scaffoldMessengerKey.currentState;

typedef LoginDetails = ({String email, String password});

final loginProvider =
    AsyncNotifierProvider.autoDispose<LoginActivity, AuthStatus>(
        LoginActivity.new);

class LoginActivity extends AutoDisposeAsyncNotifier<AuthStatus> {
  @override
  Future<AuthStatus> build() async {
    String? token = ref.watch(sharedUtilityProvider).getToken();

    return token != null
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
  }

  Future<void> login(LoginDetails arg) async {
    state = const AsyncData(AuthStatus.authenticating);
    final repo = ref.watch(repositoryProvider);
    var result = await repo.login(arg.email, arg.password);
    String? token = result['jwt_token'];

    if (token != null) {
      ref.read(sharedUtilityProvider).setToken(token);
      state = const AsyncData(AuthStatus.authenticated);
    } else {
      state = const AsyncData(AuthStatus.unauthenticated);
      scaffoldMessengerState
          ?.showSnackBar(SnackBar(content: Text(result['message'] ?? "")));
    }
  }

  void logout() {
    ref.read(sharedUtilityProvider).setToken(null);
    state = const AsyncData(AuthStatus.unauthenticated);
  }
}
