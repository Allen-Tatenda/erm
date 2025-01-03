import 'package:erm/Pages/homepage/widgets/hero.dart';
import 'package:erm/Pages/homepage/widgets/navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        SizedBox(
            height: MediaQuery.of(context).size.height - 317,
            child: const HeroWidget()),
        const SizedBox(
          height: 10,
        ),
        const NavigationWidget(),
      ],
    );
  }
}
