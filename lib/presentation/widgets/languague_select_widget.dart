import 'package:flutter/material.dart';

class LanguagueSelect extends StatefulWidget {
  const LanguagueSelect({super.key});

  @override
  State<LanguagueSelect> createState() => _LanguagueSelectState();
}

class _LanguagueSelectState extends State<LanguagueSelect> {
  String selectedLanguage = 'ES';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedLanguage,
          isDense: true,
          icon: const Icon(
            Icons.arrow_drop_down_rounded,
            color: Colors.white,
          ),
          focusColor: Colors.transparent,
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          // Constructor personalizado para los items seleccionados
          selectedItemBuilder: (BuildContext context) {
            return ['ES', 'EN'].map<Widget>((String item) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  item,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              );
            }).toList();
          },
          items: const [
            DropdownMenuItem(
              value: 'ES',
              child: Text(
                'ES',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'EN',
              child: Text(
                'EN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                selectedLanguage = value;
              });
            }
          },
        ),
      ),
    );
  }
}