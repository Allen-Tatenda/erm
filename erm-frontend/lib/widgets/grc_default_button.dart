import 'package:flutter/material.dart';

class GrcDefaultButton extends StatelessWidget {
  final String title;
  final GestureTapCallback function;

  const GrcDefaultButton({super.key, required this.title, required this.function});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: 300,
        height: 55,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 2, 1, 26),
            Colors.blue,
            Color.fromARGB(255, 2, 1, 26)
          ]),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
    );
  }
}
