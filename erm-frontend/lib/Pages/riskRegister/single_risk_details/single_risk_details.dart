import 'package:erm/Pages/riskRegister/single_risk_details/contained_tab_bar.dart';
import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:flutter/material.dart';

class SingleRiskDetails extends StatefulWidget {
  const SingleRiskDetails({super.key,required this.data});

  final data;

  @override
  State<SingleRiskDetails> createState() => _SingleRiskDetailsState();
}

class _SingleRiskDetailsState extends State<SingleRiskDetails> {
  @override
  Widget build(BuildContext context) {

          return  Scaffold(
            body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    widget.data['risk_name'],
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
        )
          );
        }
  }
