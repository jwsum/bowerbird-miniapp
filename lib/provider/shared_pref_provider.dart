import 'package:bowerbird_miniapp/util/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: sharedPrefs);
});

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  String? getToken() {
    return sharedPreferences.getString(kSharedTokenKey);
  }

  void setToken(String? token) {
    if (token != null) {
      sharedPreferences.setString(kSharedTokenKey, token);
    } else {
      sharedPreferences.remove(kSharedTokenKey);
    }
  }
}
