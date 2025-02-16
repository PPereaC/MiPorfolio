import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/data/skills_data.dart';
import '../../domain/entities/skill.dart';
import '../../generated/l10n.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final locale = AppLocalizations.of(context);

    // Agrupar habilidades por tipo
    final languages = skills.where((s) => s.type == SkillType.language).toList();
    final frameworks = skills.where((s) => s.type == SkillType.framework).toList();
    final tools = skills.where((s) => s.type == SkillType.tool).toList();
    final databases = skills.where((s) => s.type == SkillType.database).toList();

    return DefaultTabController(
      length: 4,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 600),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            // Título sección
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: locale.skillsSectionLabelP1,
                    style: textTheme.titleLarge,
                  ),
                  const WidgetSpan(
                    child: SizedBox(width: 12),
                  ),
                  TextSpan(
                    text: locale.skillsSectionLabelP2,
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
              locale.skillsSectionDescription,
              style: textTheme.bodyLarge!.copyWith(color: colors.primary),
              textAlign: TextAlign.center,
            ),
          
            const SizedBox(height: 50),
          
            TabBar(
              labelColor: colors.secondary,
              unselectedLabelColor: colors.primary,
              indicatorColor: colors.secondary,
              labelStyle: textTheme.bodyLarge,
              tabs: [
                Tab(text: locale.skillsLanguagesTitle),
                Tab(text: locale.skillsFrameworksTitle),
                Tab(text: locale.skillsToolsTitle),
                Tab(text: locale.skillsDatabasesTitle),
              ],
            ),
          
            Flexible(
              child: TabBarView(
                children: [
                  _buildSkillsGrid(languages, colors),
                  _buildSkillsGrid(frameworks, colors),
                  _buildSkillsGrid(tools, colors),
                  _buildSkillsGrid(databases, colors),
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsGrid(List<Skill> skills, ColorScheme colors) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        final skill = skills[index];
        return SkillCard(
          name: skill.name,
          iconPath: skill.iconPath,
          color: colors.primary,
        );
      },
    );
  }
}

class SkillCard extends StatefulWidget {
  final String name;
  final String iconPath;
  final Color color;

  const SkillCard({
    super.key,
    required this.name,
    required this.iconPath,
    required this.color,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Imagen SVG
              SvgPicture.asset(
                widget.iconPath,
                height: 60,
                width: 60,
                colorFilter: isHovered 
                  ? ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.srcATop,
                    )
                  : null,
              ),
          
              // Texto que aparece al hacer hover
              if (isHovered)
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    widget.name,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}