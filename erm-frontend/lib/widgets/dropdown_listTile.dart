import 'package:flutter/material.dart';

class DropDownListTile extends StatefulWidget {
  const DropDownListTile({super.key});

  @override
  State<DropDownListTile> createState() => _DropDownListTileState();
}

class _DropDownListTileState extends State<DropDownListTile> {
  @override
  Widget build(BuildContext context) {
    String title = '';
    String item1 = 'Item1';
    String item2 = 'Item2';
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text(item1),
          value: item1,
        ),
        PopupMenuItem(
          child: Text(item2),
          value: item2,
        )
      ],
      onSelected: (value) => {
        setState(() {
          title = value;
        })
      },
    );
  }
}
