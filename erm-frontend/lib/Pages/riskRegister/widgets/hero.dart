import 'package:erm/Pages/main_page.dart';
import 'package:erm/widgets/navigation_method.dart';
import 'package:flutter/material.dart';

class RiskRegisterHero extends StatelessWidget {
  const RiskRegisterHero({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/img/bg.jpg',
            fit: BoxFit.cover,
          )),
          Positioned(
            bottom: 0,
            child: Container(
              height: 10,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                
                  gradient: LinearGradient(colors: [
                    Colors.blue,
                    Color.fromARGB(255, 2, 1, 26),
                    Color.fromARGB(255, 2, 1, 26),
                    Colors.blue,
              ])),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                   gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 2, 1, 26),
                    Color.fromARGB(255, 9, 118, 207),
                    Color.fromARGB(255, 2, 1, 26)
              ]),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.elliptical(400, 444))),
              child: const Padding(
                padding: EdgeInsets.only(left: 60, top: 10, right: 80),
                child: Text(
                  'Risk Register',
                 style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600)
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset('assets/icons/logo-transparent.png',
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
              right: 20,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 2, 1, 26),
                          Colors.blue,
                          Color.fromARGB(255, 2, 1, 26)
                        ])),
                    child: InkWell(
                      onTap: () {
                        activeTab = 0;
                        navigationStream.sink.add(0);
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(10, 2, 20, 2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                            ),
                            Text(
                              'Navigation',
                             style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w600)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 2, 1, 26),
                          Colors.blue,
                          Color.fromARGB(255, 2, 1, 26)
                        ])),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 2, 10, 2),
                      child: Row(
                        children: [
                          Text(
                            'Treatments',
                            style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w600)
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
