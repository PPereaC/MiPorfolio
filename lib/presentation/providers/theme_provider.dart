import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../config/theme/app_theme.dart';


final isDarkmodeProvider = StateProvider((ref) => false);

// Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);


class ThemeNotifier extends StateNotifier<AppTheme> {

  // STATE = Estado = new AppTheme();
  ThemeNotifier(): super(AppTheme());

  void toggleDarkmode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
  
}
