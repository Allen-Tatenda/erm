import 'package:erm/Pages/homepage/widgets/hero.dart';
import 'package:erm/Pages/homepage/widgets/navigation.dart';
import 'package:flutter/material.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(builder: (context, widget) {
          var width = MediaQuery.of(context).size.width;
          if (width < 672) {
            return const SizedBox.shrink();
          }
          return SizedBox(
              height: MediaQuery.of(context).size.height - 300,
              child: const HeroWidget());
        }),
        const SizedBox(
          height: 10,
        ),
        const NavigationWidget(),
      ],
    );
  }
}
