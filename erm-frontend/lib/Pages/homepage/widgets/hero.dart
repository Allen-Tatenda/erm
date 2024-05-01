import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
            child: Image.asset(
          'assets/img/bg.jpg',
          fit: BoxFit.cover,
        )),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.transparent], stops: [0.5, 1])),
        )),
        Positioned(
          top: 40,
          left: 40,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/icons/logo-transparent.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Enterprise Risk Management',
                    style: TextStyle(
                        color: Colors.lightBlue.shade900,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                  const Text(
                    'ERM Demo V1.0.0',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
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
                      padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                      child: Text(
                        'Release Notes',
                        style: TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ]),
          ),
        )
      ],
    );
  }
}
