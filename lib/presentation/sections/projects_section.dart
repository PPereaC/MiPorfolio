import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/data/projects_data.dart';
import '../../domain/entities/project.dart';
import '../../generated/l10n.dart';
import '../widgets/widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final locale = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        children: [
    
          // Título sección
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: locale.projectsSectionLabelP1,
                  style: textTheme.titleLarge,
                ),
                // Espacio entre las palabras
                const WidgetSpan(
                  child: SizedBox(width: 12),
                ),
                TextSpan(
                  text: locale.projectsSectionLabelP2,
                  style: textTheme.titleLarge?.copyWith(
                    color: colors.secondary,
                  ),
                ),
              ],
            ),
          ),
    
          const SizedBox(height: 24),
    
          // Descripción de la sección
          Text(
            locale.projectsSectionDescription,
            style: textTheme.bodyLarge!.copyWith(
              color: colors.primary
            ),
            textAlign: TextAlign.center,
          ),
    
          const SizedBox(height: 40),
    
          ...projects.map((project) => _Project(project: project)),
    
        ],
      ),
    );
  }
}

class _Project extends StatelessWidget {

  final Project project;

  const _Project({required this.project});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Row(
        children: [
      
          // Imagen del proyecto
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              project.imagePath,
              width: 380,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
      
          const SizedBox(width: 40),
      
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
      
                // Título del proyecto
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Línea fina con degradado debajo del título
                Container(
                  margin: const EdgeInsets.only(top: 4, bottom: 4),
                  height: 2,
                  width: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colors.primary,
                        colors.secondary,
                      ],
                    ),
                  ),
                ),
      
                const SizedBox(height: 12),
      
                // Descripción del proyecto
                Text(
                  project.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                const SizedBox(height: 18),

                // Etiquetas de tecnologías
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...project.tagLabels.map((label) => TechnologyTag(label: label)),
                  ],
                ),
      
                const SizedBox(height: 20),
      
                // Botón para ver el proyecto
                _ProjectButton(url: project.repositoryUrl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget para el botón de ver el proyecto en GitHub
class _ProjectButton extends StatefulWidget {

  final String url;

  const _ProjectButton({required this.url});

  @override
  State<_ProjectButton> createState() => _ProjectButtonState();
}

class _ProjectButtonState extends State<_ProjectButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isHovered ? colors.primary.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: colors.primary,
            width: 1.5,
          ),
        ),
        child: TextButton(
          onPressed: () => launchUrl(Uri.parse(widget.url)),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            foregroundColor: colors.primary,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Ver proyecto',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                size: 18,
                color: colors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}