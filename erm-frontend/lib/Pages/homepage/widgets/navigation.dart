import 'package:erm/widgets/navigation_card_widget.dart';
import 'package:flutter/material.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> navigationWidgets = [
      const NavigationCardWidget(
        name: 'Risk Register',
        image: 'assets/icons/logo-transparent.png',
        navigateTo: 1,
      ),
      const NavigationCardWidget(
        name: 'Objectives',
        image: 'assets/icons/logo-transparent.png',
        navigateTo: 3,
      ),
      const NavigationCardWidget(
        name: 'Risk Treatments',
        image: 'assets/icons/logo-transparent.png',
        navigateTo: 4,
      ),
      const NavigationCardWidget(
        name: 'Critical Assets',
        image: 'assets/icons/logo-transparent.png',
        navigateTo: 5,
      ),
      const NavigationCardWidget(
        name: 'Top 10 Risks',
        image: 'assets/icons/logo-transparent.png',
        navigateTo: 6,
      ),
      const NavigationCardWidget(
        name: 'Risk Dashboards',
        image: 'assets/icons/logo-transparent.png',
        navigateTo: 7,
      ),
      const NavigationCardWidget(
        name: 'Risk Reporting',
        image: 'assets/icons/logo-transparent.png',
        navigateTo: 8,
      ),
      const NavigationCardWidget(
        name: 'Help Center',
        image: 'assets/icons/logo-transparent.png',
        navigateTo: 8,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Navigate',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        LayoutBuilder(builder: (context, widget) {
          var width = MediaQuery.of(context).size.width;
          if (width < 672) {
            return SizedBox(
              height: MediaQuery.of(context).size.height - 50,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(navigationWidgets.length, (index) {
                  return InkWell(
                    onTap: () {},
                    child: navigationWidgets[index],
                  );
                }),
              ),
            );
          }
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavigationCardWidget(
                name: 'Risk Register',
                image: 'assets/icons/logo-transparent.png',
                navigateTo: 1,
              ),
              NavigationCardWidget(
                name: 'Objectives',
                image: 'assets/icons/logo-transparent.png',
                navigateTo: 3,
              ),
              NavigationCardWidget(
                name: 'Risk Treatments',
                image: 'assets/icons/logo-transparent.png',
                navigateTo: 4,
              ),
              NavigationCardWidget(
                name: 'Critical Assets',
                image: 'assets/icons/logo-transparent.png',
                navigateTo: 5,
              ),
              NavigationCardWidget(
                name: 'Top 10 Risks',
                image: 'assets/icons/logo-transparent.png',
                navigateTo: 6,
              ),
              NavigationCardWidget(
                name: 'Risk Dashboards',
                image: 'assets/icons/logo-transparent.png',
                navigateTo: 7,
              ),
              NavigationCardWidget(
                name: 'Risk Reporting',
                image: 'assets/icons/logo-transparent.png',
                navigateTo: 8,
              ),
              NavigationCardWidget(
                name: 'Help Center',
                image: 'assets/icons/logo-transparent.png',
                navigateTo: 9,
              ),
            ],
          );
        }),
      ],
    );
  }
}
