import 'package:erm/widgets/navigation_method.dart';
import 'package:flutter/material.dart';

import '../Pages/main_page.dart';

class NavigationCardWidget extends StatefulWidget {
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
  State<NavigationCardWidget> createState() => _NavigationCardWidgetState();
}

class _NavigationCardWidgetState extends State<NavigationCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
           setState(() {
             activeTab = widget.navigateTo;
             navigationStream.sink.add(activeTab);
           });
        },
        child: LayoutBuilder(builder: (context, w) {
          var width = MediaQuery.of(context).size.width;
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
                        child: Image.asset(widget.image),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.name,
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
                      child: Image.asset(widget.image),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      widget.name,
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
