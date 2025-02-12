import 'package:flutter/material.dart';

import '../sections/sections.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.2),
              child: const IntroductionSection(),
            ),
          ]),
        ),
      ],
    );
  }
}