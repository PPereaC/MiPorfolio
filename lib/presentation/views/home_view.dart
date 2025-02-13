import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../responsive/desktop_body.dart';
import '../responsive/mobile_body.dart';
import '../responsive/responsive_layout.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      body: Stack(
        children: [

          Container(
            color: isDarkMode 
              ? const Color(0xFF020817)
              : const Color(0xFFF8FAFC),
          ),

          // Patrón de puntos hexagonal
          CustomPaint(
            painter: HexGridPainter(isDarkMode: isDarkMode),
            size: Size.infinite,
          ),

          // Gradiente complejo
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.0, -0.5),
                radius: 1.5,
                colors: [
                  (isDarkMode ? const Color(0xFF020817) : const Color(0xFFE2E8F0))
                      .withOpacity(0.2),
                  (isDarkMode ? const Color(0xFF020817) : const Color(0xFFE2E8F0))
                      .withOpacity(0.6),
                  (isDarkMode ? const Color(0xFF020817) : const Color(0xFFE2E8F0))
                      .withOpacity(0.9),
                ],
                stops: const [0.2, 0.6, 1.0],
              ),
            ),
          ),

          // Capa de brillo superior
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF60A5FA).withOpacity(0.1),
                  Colors.transparent,
                ],
                stops: const [0.0, 0.3],
              ),
            ),
          ),

          // Contenido responsive
          const ResponsiveLayout(
            mobileBody: MobileBody(),
            desktopBody: DesktopBody(),
          ),
        ],
      ),
    );
  }
}

class HexGridPainter extends CustomPainter {

  final bool isDarkMode;

  HexGridPainter({required this.isDarkMode});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isDarkMode 
          ? const Color(0x1A60A5FA)  // Color original para modo oscuro
          : const Color(0x1A1E40AF)  // Color azul más oscuro para modo claro
      ..strokeWidth = 2;

    const double spacing = 40; // Espacio entre hexágonos
    const double radius = 2; // Radio de los puntos
    bool offset = false;

    for (double y = 0; y < size.height; y += spacing * 0.866) {
      offset = !offset;
      for (double x = offset ? spacing/2 : 0; x < size.width; x += spacing) {
        canvas.drawCircle(
          Offset(x, y),
          radius,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}