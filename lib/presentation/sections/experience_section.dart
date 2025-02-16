import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:miporfolio/presentation/widgets/widgets.dart';

import '../../config/data/jobs_data.dart';
import '../../domain/entities/job.dart';
import '../../generated/l10n.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final locale = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Column(
        children: [

          // Título de la sección
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: locale.experienceSectionLabelP1,
                  style: textTheme.titleLarge,
                ),
                // Espacio entre las palabras
                const WidgetSpan(
                  child: SizedBox(width: 12),
                ),
                TextSpan(
                  text: locale.experienceSectionLabelP2,
                  style: textTheme.titleLarge?.copyWith(
                    color: colors.secondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),
      
          // Descripción de la sección
          Text(
            locale.experienceSectionDescription,
            style: textTheme.bodyLarge!.copyWith(
              color: colors.primary
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 80),

          // Lista de trabajos
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: jobs.length,
            itemBuilder: (context, index) {
              return TimelineItem(
                job: jobs[index],
                isLast: index == jobs.length - 1,
              );
            },
          ),

        ],
      ),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final Job job;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.job,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return IntrinsicHeight(
      child: Row(
        children: [
          _buildTimelineColumn(isLast, colors),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, bottom: 60),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                  color: colors.primary,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    job.period,
                    style: textTheme.bodyMedium
                  ),

                  const SizedBox(height: 8),

                  Text(
                    job.position,
                    style: textTheme.titleSmall
                  ),

                  const SizedBox(height: 8),

                  Text(
                    job.company,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.primary,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    job.description,
                    style: textTheme.bodyLarge
                  ),

                  const SizedBox(height: 18),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: job.technologies.map((skill) {
                      return TechnologyTag(label: skill);
                    }).toList(),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineColumn(bool isLast, ColorScheme colors) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: colors.secondary,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Icon(
              Iconsax.calendar_2_outline,
              color: Colors.white,
              size: 20,
            ),
          ),
          if (!isLast)
            Expanded(
              child: Container(
                width: 2,
                color: colors.secondary,
              ),
            ),
        ],
      ),
    );
  }
}