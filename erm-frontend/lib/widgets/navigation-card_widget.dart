import 'package:erm/widgets/navigation_method.dart';
import 'package:flutter/material.dart';

class NavigationCardWidget extends StatelessWidget {
  final String name;
  final String image;
  final int navigateTo;
  const NavigationCardWidget({
    super.key,
    required this.name,
    required this.image,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          navigationStream.sink.add(navigateTo);
        },
        child: LayoutBuilder(builder: (context, widget) {
          var width = MediaQuery.of(context).size.width;
          print(width);
          if (width < 672) {
            return SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 20,
              height: 300,
              child: Card(
                elevation: 7,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 20, 4, 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Image.asset(image),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return SizedBox(
            width: MediaQuery.of(context).size.width / 8 - 20,
            child: Card(
              elevation: 7,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 20, 4, 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(image),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
