import 'package:erm/widgets/dropdown_list_tile.dart';
import 'package:flutter/material.dart';

class ConsequencesHeader extends StatelessWidget {
  const ConsequencesHeader({
    super.key,
    required this.heading,
  });
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(26, 2, 82, 143),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              heading,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'BebasNeue',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 22, 39),
              ),
            ),
            const Row(
              children: [
                Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 0, 22, 39),
                ),
                Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 0, 22, 39),
                ),
                Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 0, 22, 39),
                ),
                DropDownListTile(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
