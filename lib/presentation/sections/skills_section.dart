import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miporfolio/config/utils/device_info.dart';
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
    final isMobile = DeviceInfo(context).isMobile;

    // Agrupar habilidades por tipo
    final languages = skills.where((s) => s.type == SkillType.language).toList();
    final frameworks = skills.where((s) => s.type == SkillType.framework).toList();
    final tools = skills.where((s) => s.type == SkillType.tool).toList();
    final databases = skills.where((s) => s.type == SkillType.database).toList();
    final others = skills.where((s) => s.type == SkillType.others).toList();

    return DefaultTabController(
      length: 5,
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
          
            // TabBar
            isMobile
              ? _mobileTabBar(colors, textTheme, locale, isMobile)
              : _desktopTabBar(colors, textTheme, locale),
          
            Flexible(
              child: TabBarView(
                children: [
                  _buildSkillsGrid(languages, colors, isMobile),
                  _buildSkillsGrid(frameworks, colors, isMobile),
                  _buildSkillsGrid(tools, colors, isMobile),
                  _buildSkillsGrid(databases, colors, isMobile),
                  _buildSkillsGrid(others, colors, isMobile),
                ],
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  Widget _mobileTabBar(ColorScheme colors, TextTheme textTheme, AppLocalizations locale, bool isMobile) {
    return TabBar(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.primary,
      indicatorColor: colors.secondary,
      labelStyle: isMobile 
        ? textTheme.bodyMedium
        : textTheme.bodyLarge,
      isScrollable: isMobile, // Permite scroll horizontal en móvil
      tabAlignment: isMobile ? TabAlignment.start : TabAlignment.center,
      padding: isMobile ? EdgeInsets.zero : null,
      tabs: [
        Tab(
          text: locale.skillsLanguagesTitle,
          height: isMobile ? 35 : 46,
        ),
        Tab(
          text: locale.skillsFrameworksTitle,
          height: isMobile ? 35 : 46,
        ),
        Tab(
          text: locale.skillsToolsTitle,
          height: isMobile ? 35 : 46,
        ),
        Tab(
          text: locale.skillsDatabasesTitle,
          height: isMobile ? 35 : 46,
        ),
        Tab(
          text: locale.skillsOthersTitle,
          height: isMobile ? 35 : 46,
        ),
      ],
    );
  }

  Widget _desktopTabBar(ColorScheme colors, TextTheme textTheme, AppLocalizations locale) {
    return TabBar(
      labelColor: colors.secondary,
      unselectedLabelColor: colors.primary,
      indicatorColor: colors.secondary,
      labelStyle: textTheme.bodyLarge,
      tabs: [
        Tab(text: locale.skillsLanguagesTitle),
        Tab(text: locale.skillsFrameworksTitle),
        Tab(text: locale.skillsToolsTitle),
        Tab(text: locale.skillsDatabasesTitle),
        Tab(text: locale.skillsOthersTitle),
      ],
    );
  }

  Widget _buildSkillsGrid(List<Skill> skills, ColorScheme colors, bool isMobile) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 16 : 24,
        horizontal: isMobile ? 8 : 16
      ),
      physics: const ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isMobile ? 3 : 7, // 3 columnas en móvil, 7 en desktop
        crossAxisSpacing: isMobile ? 16 : 8,
        mainAxisSpacing: isMobile ? 16 : 8,
        childAspectRatio: 1.0,
      ),
      itemCount: skills.length,
      itemBuilder: (context, index) {
        final skill = skills[index];
        return SkillCard(
          name: skill.name,
          iconPath: skill.iconPath,
          color: colors.primary,
          isMobile: isMobile,
        );
      },
    );
  }
}

class SkillCard extends StatefulWidget {
  final String name;
  final String iconPath;
  final Color color;
  final bool isMobile;

  const SkillCard({
    super.key,
    required this.name,
    required this.iconPath,
    required this.color,
    this.isMobile = false,
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
        width: widget.isMobile ? 80 : 60,
        height: widget.isMobile ? 80 : 60,
        child: widget.isMobile
            ? _buildMobileCard()
            : _buildDesktopCard(),
      ),
    );
  }

  Widget _buildMobileCard() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          widget.iconPath,
          height: 40,
          width: 40,
        ),
        const SizedBox(height: 8),
        Text(
          widget.name,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildDesktopCard() {
    return SizedBox(
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
    );
  }

}