import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class SliverAppBarSection extends ConsumerWidget {
  const SliverAppBarSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final locale = AppLocalizations.of(context);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return SliverAppBar(
      backgroundColor: isDarkMode ? Theme.of(context).scaffoldBackgroundColor : Colors.transparent,
      floating: true,
      pinned: true,
      elevation: 0,
      toolbarHeight: 70,
      stretch: true,
      forceElevated: true,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0, 
      actions: const [
        ThemeToggleButton(),
        SizedBox(width: 16),
        Padding(
          padding: EdgeInsets.only(right: 18),
          child: LanguagueSelect(),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NavButton(
              title: locale.homeSection,
              onPressed: () {},
              isDarkMode: isDarkMode
            ),
            _NavButton(
              title: locale.projectsSection,
              onPressed: () {},
              isDarkMode: isDarkMode
            ),
            _NavButton(
              title: locale.experienceSection,
              onPressed: () {},
              isDarkMode: isDarkMode
            ),
            _NavButton(
              title: locale.technologiesSection,
              onPressed: () {},
              isDarkMode: isDarkMode
            ),
            _NavButton(
              title: locale.trainingSection,
              onPressed: () {},
              isDarkMode: isDarkMode
            ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {

  final bool isDarkMode;
  final String title;
  final VoidCallback onPressed;

  const _NavButton({
    required this.title,
    required this.onPressed,
    required this.isDarkMode
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}