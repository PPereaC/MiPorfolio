import 'package:flutter/material.dart';

import '../sections/sections.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        
        // Sección de introducción
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const IntroductionSection(),
          ),
        ),
    
        // Sección de los proyectos
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const ProjectsSection(),
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: height * 0.15),
        ),

        // Sección de la experiencia
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const ExperienceSection(),
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: height * 0.1),
        ),

        // Sección de habilidades
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const SkillsSection(),
          ),
        ),

        // Sección de formación
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const TrainingSection(),
          ),
        ),

        SliverToBoxAdapter(
          child: SizedBox(height: height * 0.15),
        ),

        // Sección de footer
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const FooterSection(),
          ),
        ),

      ],
    );
  }
}