import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/data/certifications_data.dart';
import '../../domain/entities/certification.dart';
import '../../generated/l10n.dart';

class TrainingSection extends StatelessWidget {
  const TrainingSection({super.key});

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
                  text: locale.trainingSectionLabelP1,
                  style: textTheme.titleLarge,
                ),
                const WidgetSpan(
                  child: SizedBox(width: 12),
                ),
                TextSpan(
                  text: locale.trainingSectionLabelP2,
                  style: textTheme.titleLarge?.copyWith(
                    color: colors.secondary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Descripción
          Text(
            locale.trainingSectionDescription,
            style: textTheme.bodyLarge!.copyWith(color: colors.primary),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 50),

          // Formación Académica
          _buildEducationCard(context),

          const SizedBox(height: 48),

          // Certificaciones
          _buildCertificationsGrid(context),
        ],
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
  
    return Align(
      alignment: Alignment.center,
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: colors.primary,
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.school_outlined,
                size: 34,
                color: colors.primary,
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CFGS Desarrollo de Aplicaciones Multiplataforma',
                      style: textTheme.bodyLarge
                    ),
                    Text(
                      'IES Gregorio Prieto',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.primary
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCertificationsGrid(BuildContext context) {
    // Calculamos cuántas columnas queremos basándonos en el ancho de la pantalla
    final screenWidth = MediaQuery.of(context).size.width;
    // Ancho deseado para cada tarjeta
    const desiredCardWidth = 220.0;
    // Calculamos el número de columnas (mínimo 2, máximo 3)
    final crossAxisCount = (screenWidth / desiredCardWidth).floor().clamp(2, 3);
  
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 16 / 10,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: certifications.length,
      itemBuilder: (context, index) {
        return CertificationCard(
          certification: certifications[index],
        );
      },
    );
  }
}

class CertificationCard extends StatefulWidget {
  final Certification certification;

  const CertificationCard({
    super.key,
    required this.certification,
  });

  @override
  CertificationCardState createState() => CertificationCardState();
}

class CertificationCardState extends State<CertificationCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovering 
                ? colors.primary 
                : colors.primary.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                final Uri url = Uri.parse(widget.certification.certificateUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: Column(
                children: [
                  // Header con logo y título
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: SvgPicture.asset(
                            widget.certification.platformLogo,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            widget.certification.name,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Imagen
                  Expanded(
                    child: Image.asset(
                      widget.certification.courseImage,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}