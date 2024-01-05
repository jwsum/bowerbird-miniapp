import 'package:bowerbird_miniapp/provider/auth_provider.dart';
import 'package:bowerbird_miniapp/ui/screen/login_screen.dart';
import 'package:bowerbird_miniapp/ui/screen/message_group_screen.dart';
import 'package:bowerbird_miniapp/ui/screen/splash_screen.dart';
import 'package:bowerbird_miniapp/util/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    switch (auth) {
      case AuthStatus.unauthenticated:
        return const LoginScreen();
      case AuthStatus.authenticated:
        return const MessageGroupScreen();
      case AuthStatus.uninitialized:
      case AuthStatus.authenticating:
      default:
        return const SplashScreen();
    }
  }
}
