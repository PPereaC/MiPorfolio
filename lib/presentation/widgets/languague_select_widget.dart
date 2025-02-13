import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

class LanguagueSelect extends ConsumerWidget {
  const LanguagueSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    final currentLocale = ref.watch(languageProvider).languageCode.toUpperCase();
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDarkMode 
            ? Colors.white.withOpacity(0.3)
            : Colors.black.withOpacity(0.3)
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          hoverColor: Colors.transparent,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: currentLocale,
            isDense: true,
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            
            focusColor: Colors.transparent,
            dropdownColor: Theme.of(context).scaffoldBackgroundColor,
            selectedItemBuilder: (BuildContext context) {
              return ['ES', 'EN'].map<Widget>((String item) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item,
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList();
            },
            items: [
              DropdownMenuItem(
                value: 'ES',
                child: Text(
                  'ES',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'EN',
                child: Text(
                  'EN',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
            onChanged: (String? value) {
              if (value != null) {
                ref.read(languageProvider.notifier).changeLanguage(value);
              }
            },
          ),
        ),
      ),
    );
  }
}