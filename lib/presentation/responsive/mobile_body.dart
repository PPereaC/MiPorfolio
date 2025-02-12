import 'package:flutter/material.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        // Sección de introducción
        const SliverToBoxAdapter(
          child: SizedBox(
            
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: height * 0.05),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 28),
        ),
      ],
    );
  }
}