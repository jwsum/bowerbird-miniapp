import 'package:bowerbird_miniapp/provider/shared_pref_provider.dart';
import 'package:bowerbird_miniapp/util/enum.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthStatus>((ref) => AuthNotifier(ref));

class AuthNotifier extends StateNotifier<AuthStatus> {
  AuthNotifier(this.ref) : super(AuthStatus.uninitialized) {
    String? token = ref.watch(sharedUtilityProvider).getToken();
    state =
        token != null ? AuthStatus.authenticated : AuthStatus.unauthenticated;
  }
  Ref ref;

  void changeStatus(AuthStatus status) {
    state = status;
  }
}

final loginProvider = FutureProvider.autoDispose<String>((ref) async {
  return "";
});
