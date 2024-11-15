import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider extends StateNotifier<bool> {
  ThemeProvider() : super(false);

  Future toogleTheme() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    state = !state;
    await asyncPrefs.setBool('theme', state);
  }

  Future getSavedTheme() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    final bool? savedTheme = await asyncPrefs.getBool('theme');
    state = savedTheme ?? false;
  }
}

final themeProvider =
    StateNotifierProvider<ThemeProvider, bool>((ref) => ThemeProvider());
