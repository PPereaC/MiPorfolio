import 'package:flutter/material.dart';

import '../sections/sections.dart';
import '../sections/sliver_appbar.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        // Appbar con las secciones del sitio
        const SliverAppBarSection(),
        
        // Contenido
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const IntroductionSection(),
          ),
        ),
      ],
    );
  }
}