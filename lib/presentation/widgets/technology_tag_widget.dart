import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TechnologyTag extends StatelessWidget {
  final String label;

  const TechnologyTag({
    super.key, 
    required this.label,
  });

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final rutaIcono = 'assets/svgs/${label.toLowerCase().replaceAll(' ', '')}.svg';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colors.secondary,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          // Icono de la tecnología
          SvgPicture.asset(
            rutaIcono,
            width: 14,
            height: 14,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.code, size: 14);
            },
          ),

          const SizedBox(width: 8),

          // Nombre de la tecnología
          Text(
            label,
            style: textTheme.bodySmall
          ),

        ],
      ),
    );
  }
}