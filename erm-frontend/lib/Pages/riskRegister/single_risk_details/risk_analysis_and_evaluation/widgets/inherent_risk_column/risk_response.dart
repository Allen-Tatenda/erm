import 'package:erm/widgets/dropdown_list_tile.dart';
import 'package:flutter/material.dart';

class RiskResponseWidget extends StatefulWidget {
  const RiskResponseWidget({
    super.key,
    required this.data,
  });

  final List data;

  @override
  State<RiskResponseWidget> createState() => _RiskResponseWidgetState();
}

class _RiskResponseWidgetState extends State<RiskResponseWidget> {

  bool showEditing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width / 3,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
           Container(
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
              (showEditing==false)?'RISK RESPONSE':'SELECT RISK RESPONSE',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'BebasNeue',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 22, 39),
              ),
            ),
            Row(
              children: [



            (showEditing==false)?InkWell(
                  onTap: () {
                    setState(() {
                      showEditing = true;
                    });
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 0, 22, 39),
                  ),
                ):Row(
                  children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      showEditing = false;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    color: Color.fromARGB(255, 0, 22, 39),
                  ),
                ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          showEditing = false;
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: Color.fromARGB(255, 0, 22, 39),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const Positioned(child: RiskResponseData(response: 'MITIGATE')),
                Visibility(
                  visible: showEditing,
                  child: EditConsequences()
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditConsequences extends StatefulWidget {
  EditConsequences({
    super.key,
  });

  @override
  State<EditConsequences> createState() => _EditConsequencesState();
}

class _EditConsequencesState extends State<EditConsequences> {
  String selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 117,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child:  Column(children: [
           Row(
             children: [
               Expanded(
                 child: RadioListTile<String>(
                    title: const Text("AVOIDENCE",style: TextStyle(fontSize: 12),),
                    value: "AVOID",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
               ),
                 Expanded(
                   child: RadioListTile<String>(
                                   title: const Text("ACCEPTENCE",style: TextStyle(fontSize: 12),),
                                   value: "ACCEPT",
                                   groupValue: selectedOption,
                                   onChanged:(value){
                   setState(() {selectedOption=value!;}
                                    );
                       }),
                 ),
             ],
           ),
           
           Row(
             children: [
               Expanded(
                
                 child: RadioListTile<String>(
                    title: const Text("MITIGATION",style: TextStyle(fontSize: 12),),
                    value: "MITIGATE",
                    groupValue: selectedOption,
                    onChanged:(value){
                       setState(() {selectedOption=value!;}
                     );
                           }),
               ),
          Expanded(
            child: RadioListTile<String>(
                            title: const Text("TRANSFERENCE",style: TextStyle(fontSize: 12),),
                            value: "TRANSFER",
                            groupValue: selectedOption,
                            onChanged:(value){
                                setState(() {selectedOption=value!;}
                              );
                                    }),
          )
             ],
           ),
          
        ],),
      )
    );
  }
}

class RiskResponseData extends StatelessWidget {
  const RiskResponseData({
    super.key,
    required this.response,
  });

  final String response;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      height: 100,
      child: Center(child: Text(response,
      style: const TextStyle(fontSize: 80,fontWeight: FontWeight.w800,color: Colors.black38),
      )),
    );
  }
}
