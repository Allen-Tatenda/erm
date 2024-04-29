import 'package:erm/Pages/riskRegister/loss_of_key_employee/contained_tab_bar.dart';
import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:flutter/material.dart';

class LossOfKeyEmployee extends StatefulWidget {
  const LossOfKeyEmployee({super.key});

  @override
  State<LossOfKeyEmployee> createState() => _LossOfKeyEmployeeState();
}

class _LossOfKeyEmployeeState extends State<LossOfKeyEmployee> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: const Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Text(
                'Loss Of Key Employee',
                style: TextStyle(
                    fontSize: 36,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                width: 20,
              ),
              DropDownListTile()
            ],
          ),
          LossOfKeyContainedTabBar()
        ],
      ),
    );
  }
}
