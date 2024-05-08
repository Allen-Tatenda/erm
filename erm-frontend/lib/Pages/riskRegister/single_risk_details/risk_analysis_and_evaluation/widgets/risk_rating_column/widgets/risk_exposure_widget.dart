import 'package:flutter/material.dart';

import '../../../../../../../widgets/dropdown_listTile.dart';

import '../../RiskInformation/widgets/risk_info_subheading_text.dart';

class RiskExposureWidget extends StatefulWidget {
  const RiskExposureWidget({
    super.key,
  });

  @override
  State<RiskExposureWidget> createState() => _RiskExposureWidgetState();
}

class _RiskExposureWidgetState extends State<RiskExposureWidget> {
  bool showEditing = false;

  bool isEditingShown = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: !showEditing,
          child: Positioned(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: ((MediaQuery.of(context).size.width / 3) / 2) - 26,
               height: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.circular(4)),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
            const Text(
              'RISK EXPOSURE',
              style: TextStyle(
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
                      print(showEditing);
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
    ),
                    const RiskInfoSubHeadingAndText(
                        subheading: 'RISK IMPACT (\$)', text: '40,000 \$'),
                    const RiskInfoSubHeadingAndText(
                        subheading: 'RISK EXPOSURE (\$)', text: '40,0000 \$'),
                  ],
                ),
              ),
            ),
          ),
        ),



                Visibility(
                  visible: showEditing,
                  child: Positioned(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Container(
                                width: ((MediaQuery.of(context).size.width / 3) / 2) - 26,
                                 height: 180,
                                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.circular(4)),
                                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                           InkWell(
                            onTap: () {
                              setState(() {
                                 showEditing = false;
                              });
                            },
                            child: const Icon(Icons.close)),
                          const Icon(Icons.done)
                        ],
                      ),
                      const Text(
                            'RISK IMPACT',
                            style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
                          ),
                      const SizedBox(
                        height: 40,
                        child: TextField(
                          
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)))
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                  
                        const Text(
                            'RISK EXPOSURE',
                            style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
                          ),
                      const SizedBox(
                        height: 40,
                        child: TextField(
                          
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4)))
                          ),
                        ),
                      ),
                    ],
                  ),
                                ),
                              ),
                            ),
                          ),
                ),
      ],
    );
  }
}
