import 'package:flutter/material.dart';

import '../sections/sections.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [

        // Secciones
        CustomScrollView(
          slivers: [
            
            // Sección de introducción
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: const IntroductionSection(),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(height: height * 0.1),
            ),
        
            // Sección de los proyectos
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: const ProjectsSection(),
              ),
            ),
        
            SliverToBoxAdapter(
              child: SizedBox(height: height * 0.15),
            ),
        
            // Sección de la experiencia
            const SliverToBoxAdapter(
              child: ExperienceSection(),
            ),
        
            SliverToBoxAdapter(
              child: SizedBox(height: height * 0.1),
            ),
        
            // Sección de habilidades
            const SliverToBoxAdapter(
              child: SkillsSection(),
            ),
        
            // Sección de formación
            const SliverToBoxAdapter(
              child: TrainingSection(),
            ),
        
            SliverToBoxAdapter(
              child: SizedBox(height: height * 0.15),
            ),
        
            // Sección de footer
            const SliverToBoxAdapter(
              child: FooterSection(),
            ),
        
          ],
        ),

        // // Selector de idioma flotante
        // const Positioned(
        //   top: 20,
        //   right: 20,
        //   child: LanguagueSelect(),
        // ),

      ],
    );
  }
}