import 'package:erm/Pages/homepage/home_page.dart';
import 'package:erm/Pages/homepage/mobile/mobile.dart';
import 'package:flutter/material.dart';

class HomePageResponsive extends StatelessWidget {
  const HomePageResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, widget) {
      var width = MediaQuery.of(context).size.width;
      print(width);
      if (width < 672) {
        return MobileHomePage();
      }
      return HomePage();
    });
  }
}
