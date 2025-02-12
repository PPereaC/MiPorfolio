import 'package:flutter/material.dart';

import '../responsive/desktop_body.dart';
import '../responsive/mobile_body.dart';
import '../responsive/responsive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          // Fondo base oscuro
          Container(
            color: const Color(0xFF020617),
          ),

          // Patrón de cuadrícula
          CustomPaint(
            painter: GridPainter(),
            size: Size.infinite,
          ),

          // Gradiente radial para el efecto de máscara
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: const Alignment(0.0, -1.0),
                radius: 1.0,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
                stops: const [0.7, 1.0],
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

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x4F4F4F2E) // Color de las líneas
      ..strokeWidth = 1;

    // Líneas verticales
    for (double x = 0; x < size.width; x += 14) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    // Líneas horizontales
    for (double y = 0; y < size.height; y += 24) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}