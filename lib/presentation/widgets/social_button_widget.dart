import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatefulWidget {
  final String icon;
  final VoidCallback onPressed;

  const SocialButton({
    super.key, 
    required this.icon, 
    required this.onPressed,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isHovered ? colors.secondary : colors.primary.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              widget.icon,
              width: widget.icon.contains('email') || widget.icon.contains('cv') ? 30 : 24,
              height: widget.icon.contains('email') || widget.icon.contains('cv') ? 30 : 24,
              colorFilter: ColorFilter.mode(
                colors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}