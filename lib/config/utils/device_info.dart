import 'package:flutter/material.dart';

class DeviceInfo {
  final BuildContext context;

  const DeviceInfo(this.context);

  // Breakpoints
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1200;

  // Getters
  bool get isMobile => MediaQuery.of(context).size.width < mobileBreakpoint;
  
  bool get isTablet => MediaQuery.of(context).size.width >= mobileBreakpoint && MediaQuery.of(context).size.width < tabletBreakpoint;
  
  bool get isDesktop => MediaQuery.of(context).size.width >= tabletBreakpoint;

  // Método para obtener el ancho actual
  double get screenWidth => MediaQuery.of(context).size.width;
  
  // Método para obtener el alto actual
  double get screenHeight => MediaQuery.of(context).size.height;
}