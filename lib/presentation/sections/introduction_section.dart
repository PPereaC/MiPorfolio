import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config/utils/constants.dart';
import '../../generated/l10n.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class IntroductionSection extends ConsumerWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final locale = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                // Columna 1 - Detalles
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                
                      // Etiqueta para marcar si estoy disponible para trabajar
                      _AvailabilityDot(colors: colors, locale: locale, textTheme: textTheme),
                
                      const SizedBox(height: 24),
                  
                      // Nombre
                      Text(
                        'Pablo Perea Campos',
                        style: textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold
                        )
                      ),
                  
                      const SizedBox(height: 8),
                  
                      // Ocupación
                      Text(
                        locale.occupation,
                        style: textTheme.titleSmall!.copyWith(
                          color: isDarkMode ? Colors.white.withOpacity(0.85) : Colors.black.withOpacity(0.85),
                          fontWeight: FontWeight.normal
                        )
                      ),
                  
                      const SizedBox(height: 24),
                  
                      // Descripción
                      _MyDescription(textTheme: textTheme, colors: colors),
                
                      const SizedBox(height: 24),
                
                      // Botones sociales
                      const _SocialButtons(),
                  
                    ],
                  ),
                ),
                
                // Foto de perfil
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colors.primary.withOpacity(0.1),
                            colors.secondary.withOpacity(0.1),
                          ],
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        boxShadow: [
                          // Efecto neón interior
                          BoxShadow(
                            color: const Color(0xFFE29E21).withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          // Efecto neón exterior
                          BoxShadow(
                            color: const Color(0xFFE29E21).withOpacity(0.2),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                          // Sombra direccional
                          BoxShadow(
                            color: const Color(0xFFE29E21).withOpacity(0.15),
                            blurRadius: 25,
                            spreadRadius: 3,
                            offset: const Offset(10, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/foto_perfil.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                  
                  
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AvailabilityDot extends StatelessWidget {

  final ColorScheme colors;
  final AppLocalizations locale;
  final TextTheme textTheme;

  const _AvailabilityDot({
    required this.colors,
    required this.locale,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colors.secondary.withOpacity(0.15),
        border: Border.all(
          color: colors.secondary.withOpacity(0.8),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AnimatedAvailabilityDot(),
          const SizedBox(width: 8),
          Text(
            locale.availableToWork,
            style: textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyDescription extends StatelessWidget {

  final TextTheme textTheme;
  final ColorScheme colors;

  const _MyDescription({
    required this.textTheme,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {

    final locale = AppLocalizations.of(context);

    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: textTheme.bodyLarge,
        children: [
          TextSpan(
            text: locale.introduction_como,
          ),
          TextSpan(
            text: locale.introduction_desarrollador,
            style: textTheme.bodyLarge?.copyWith(
              color: colors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: locale.introduction_pasion,
          ),
          TextSpan(
            text: locale.introduction_aplicaciones,
            style: textTheme.bodyLarge?.copyWith(
              color: colors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: locale.introduction_diferencia,
          ),
          TextSpan(
            text: locale.introduction_multiplataforma,
            style: textTheme.bodyLarge?.copyWith(
              color: colors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: locale.introduction_soluciones,
          ),
          TextSpan(
            text: locale.introduction_curiosa,
            style: textTheme.bodyLarge?.copyWith(
              color: colors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: locale.introduction_buscando,
          ),
          TextSpan(
            text: locale.introduction_desafios,
            style: textTheme.bodyLarge?.copyWith(
              color: colors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: locale.introduction_creciendo,
          ),
        ],
      ),
    );
  }
}

class _SocialButtons extends StatelessWidget {

  const _SocialButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
    
        // LinkedIn
        SocialButton(
          icon: 'assets/svgs/linkedin.svg',
          onPressed: () => launchUrl(Uri.parse(linkedinUrl))
        ),
    
        const SizedBox(width: 16),
        
        // GitHub
        SocialButton(
          icon: 'assets/svgs/Github_dark.svg',
          onPressed: () => launchUrl(Uri.parse(githubLink))
        ),
    
        const SizedBox(width: 16),
        
        // Gmail
        SocialButton(
          icon: 'assets/svgs/email.svg',
          onPressed: () => launchUrl(Uri.parse(emailLink))
        ),
    
        const SizedBox(width: 16),
        
        // CV
        SocialButton(
          icon: 'assets/svgs/cv.svg',
          onPressed: () => launchUrl(Uri.parse(cvLink))
        ),
      ],
    );
  }
}

