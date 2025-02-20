import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:miporfolio/presentation/widgets/widgets.dart';

import '../../config/data/jobs_data.dart';
import '../../config/utils/device_info.dart';
import '../../domain/entities/job.dart';
import '../../generated/l10n.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final locale = AppLocalizations.of(context);
    final jobs = getJobs(locale);
    final isMobile = DeviceInfo(context).isMobile;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: isMobile 
        ? _mobileBuild(context, textTheme, colors, locale, jobs)
        : _desktopBuild(context, textTheme, colors, locale, jobs),
    );

    
  }
}

Widget _mobileBuild(BuildContext context, TextTheme textTheme, ColorScheme colors, AppLocalizations locale, List<Job> jobs) {
  return Column(
    children: [
      // Título de la sección
      Text(
        locale.experienceSectionLabelP1,
        style: textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
      
      Text(
        locale.experienceSectionLabelP2,
        style: textTheme.titleLarge?.copyWith(
          color: colors.secondary,
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 24),
  
      // Descripción de la sección
      Text(
        locale.experienceSectionDescription,
        style: textTheme.bodyLarge!.copyWith(
          color: colors.primary
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 60),
      // Lista de trabajos
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return TimelineItem(
            job: jobs[index],
            isLast: index == jobs.length - 1,
            isMobile: true,
          );
        },
      ),
    ],
  );
}

Widget _desktopBuild(BuildContext context, TextTheme textTheme, ColorScheme colors, AppLocalizations locale, List<Job> jobs) {
  return Column(
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
  
      const SizedBox(height: 24),
  
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
  );
}

class TimelineItem extends StatelessWidget {
  final Job job;
  final bool isLast;
  final bool isMobile;

  const TimelineItem({
    super.key,
    required this.job,
    this.isLast = false,
    this.isMobile = false
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
              margin: EdgeInsets.only(
                left: isMobile ? 16 : 20,
                bottom: isMobile ? 40 : 60
              ),
              padding: EdgeInsets.all(isMobile ? 16 : 20),
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
                    style: isMobile 
                      ? textTheme.bodyMedium 
                      : textTheme.bodyMedium
                  ),

                  const SizedBox(height: 8),

                  Text(
                    job.position,
                    style: isMobile 
                      ? textTheme.bodyLarge
                      : textTheme.titleSmall
                  ),

                  const SizedBox(height: 8),

                  Text(
                    job.company,
                    style: (isMobile 
                      ? textTheme.bodyMedium 
                      : textTheme.bodyMedium)?.copyWith(color: colors.primary),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    job.description,
                    style: isMobile 
                      ? textTheme.bodyLarge?.copyWith(
                        fontSize: 16
                      ) 
                      : textTheme.bodyLarge
                  ),

                  const SizedBox(height: 18),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: job.technologies.map((skill) {
                      return TechnologyTag(
                        label: skill,
                      );
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
      width: isMobile ? 40 : 60,
      child: Column(
        children: [
          Container(
            width: isMobile ? 30 : 40,
            height: isMobile ? 30 : 40,
            decoration: BoxDecoration(
              color: colors.secondary,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white, 
                width: isMobile ? 2 : 3
              ),
            ),
            child: Icon(
              Iconsax.calendar_2_outline,
              color: Colors.white,
              size: isMobile ? 16 : 20,
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