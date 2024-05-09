import 'package:erm/widgets/dropdown_list_tile.dart';
import 'package:flutter/material.dart';

class RiskInformationHeader extends StatefulWidget {
   const RiskInformationHeader({
    super.key,
    required this.heading, required this.logic,
  });
  final String heading;
   final bool logic;

  @override
  State<RiskInformationHeader> createState() => _RiskInformationHeaderState();
}

class _RiskInformationHeaderState extends State<RiskInformationHeader> {
  bool showEditing = false;
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
              widget.heading,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'BebasNeue',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 22, 39),
              ),
            ),
           Row(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      showEditing = true;
                    });
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 0, 22, 39),
                  ),
                ),
                const DropDownListTile(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
