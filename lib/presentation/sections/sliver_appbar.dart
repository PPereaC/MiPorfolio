import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../widgets/widgets.dart';

class SliverAppBarSection extends StatelessWidget {
  const SliverAppBarSection({super.key});

  @override
  Widget build(BuildContext context) {

    final locale = AppLocalizations.of(context);

    return SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floating: true,
      pinned: true,
      elevation: 0,
      toolbarHeight: 70,
      stretch: true,
      forceElevated: true,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0, 
      actions: [
        ThemeToggleButton(isDarkMode: true, onChanged: (value) {}),
        const SizedBox(width: 16),
        const Padding(
          padding: EdgeInsets.only(right: 18),
          child: LanguagueSelect(),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NavButton(title: locale.homeSection, onPressed: () {}),
            _NavButton(title: locale.projectsSection, onPressed: () {}),
            _NavButton(title: locale.experienceSection, onPressed: () {}),
            _NavButton(title: locale.technologiesSection, onPressed: () {}),
            _NavButton(title: locale.trainingSection, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.title,
    required this.onPressed,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}