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
            child: Image.network(
          'https://images.unsplash.com/photo-1582441814869-a262426017f9?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/icons/logo-transparent.png'),
                  ),
                  SizedBox(
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(colors: [
                          Colors.lightBlue.shade900,
                          Colors.blueAccent
                        ])),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                      child: Text(
                        'Release Notes',
                        style: TextStyle(color: Colors.white, fontSize: 12),
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
