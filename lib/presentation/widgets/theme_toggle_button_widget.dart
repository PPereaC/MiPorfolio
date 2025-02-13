import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../providers/providers.dart';

class ThemeToggleButton extends ConsumerWidget {

  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final locale = AppLocalizations.of(context);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: IconButton(
        icon: Icon(
          isDarkMode ? Icons.dark_mode : Icons.light_mode,
          color: Colors.white,
          size: 24,
        ),
        onPressed: () => ref.read(themeNotifierProvider.notifier).toggleDarkmode(),
        tooltip: isDarkMode ? locale.toggleToLightMode : locale.toggleToDarkMode,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        splashRadius: 20,
      ),
    );
  }
}