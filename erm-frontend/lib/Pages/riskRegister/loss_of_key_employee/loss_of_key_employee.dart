import 'package:erm/Pages/riskRegister/loss_of_key_employee/contained_tab_bar.dart';
import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:flutter/material.dart';

class LossOfKeyEmployee extends StatefulWidget {
  const LossOfKeyEmployee({super.key});

  @override
  State<LossOfKeyEmployee> createState() => _LossOfKeyEmployeeState();
}

class _LossOfKeyEmployeeState extends State<LossOfKeyEmployee> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: riskInfoStream.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return  Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    singleRiskData['risk_name'],
                    style: const TextStyle(
                        fontSize: 36,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const DropDownListTile()
                ],
              ),
              LossOfKeyContainedTabBar()
            ],
          ),
        );
        }

        return const CircularProgressIndicator();
      }
    );
  }
}
