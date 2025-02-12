import 'package:flutter/material.dart';

class AnimatedAvailabilityDot extends StatefulWidget {
  const AnimatedAvailabilityDot({super.key});

  @override
  State<AnimatedAvailabilityDot> createState() => _AnimatedAvailabilityDotState();
}

class _AnimatedAvailabilityDotState extends State<AnimatedAvailabilityDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.6),
                blurRadius: 6 * _animation.value,
                spreadRadius: 2 * _animation.value,
              ),
            ],
          ),
        );
      },
    );
  }
}