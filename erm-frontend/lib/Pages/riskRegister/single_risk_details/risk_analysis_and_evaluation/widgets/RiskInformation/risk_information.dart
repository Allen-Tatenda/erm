import 'package:erm/Pages/riskRegister/single_risk_details/risk_analysis_and_evaluation/widgets/RiskInformation/widgets/risk_info_subheading_text.dart';
import 'package:erm/widgets/dropdown_list_tile.dart';
import 'package:erm/widgets/shimmer_box.dart';
import 'package:flutter/material.dart';

int selectedValue = 0;

List<DropdownMenuItem> items = [
  const DropdownMenuItem(
    value: 0,
    enabled: false,
    child: Text('Risk Priority'),
  ),
  const DropdownMenuItem(value: 2, child: Text('Option B')),
  const DropdownMenuItem(value: 3, child: Text('Option C')),
  const DropdownMenuItem(
    value: 4,
    child: Text('Option D'),
  ),
];

class RiskInformation extends StatefulWidget {
  const RiskInformation({
    super.key,
  });

  @override
  State<RiskInformation> createState() => _RiskInformationState();
}

class _RiskInformationState extends State<RiskInformation> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: null,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Expanded(
                child: ShimmerBoxWidget(
              height: MediaQuery.of(context).size.height,
            ));
          } else if (snapshot.hasError) {
            return const Center(
                child: Text(
                    'Error occured while loading, Please check your network settings.'));
          } else {
            print(snapshot.data);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: (MediaQuery.of(context).size.width / 3) - 36,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(26, 2, 82, 143),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Risk Information',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'BebasNeue',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 22, 39),
                              ),
                            ),
                            Row(
                              children: [
                                // InkWell(
                                //   onTap: () {
                                //     setState(() {
                                      
                                //     });
                                //   },
                                //   child: Icon(
                                //     (showEditing == false)
                                //         ? Icons.edit
                                //         : Icons.close,
                                //     color: const Color.fromARGB(255, 0, 22, 39),
                                //   ),
                                // ),
                                const DropDownListTile(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        // (showEditing == false)
                        //     ? Positioned(
                        //         child:
                        //             RiskInfomationDetails())
                        //     : const Positioned(child: EditRiskDetails())
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}

class EditRiskDetails extends StatelessWidget {
  const EditRiskDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(6, 0, 0, 0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: .1)),
              label: const Text('Risk Name'),
              border: InputBorder.none,
              filled: true,
              fillColor: const Color.fromARGB(8, 0, 0, 0),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Risk Priority',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SelectPrioRity(),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: .1)),
              label: const Text('Risk Description'),
              border: InputBorder.none,
              filled: true,
              fillColor: const Color.fromARGB(8, 0, 0, 0),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Risk Category',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SelectPrioRity(),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Risk Division',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SelectPrioRity(),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Strategic Objective',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SelectPrioRity(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
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
              child: const Center(
                  child: Text('SUBMIT',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
        ],
      ),
    );
  }
}

class RiskInfomationDetails extends StatelessWidget {
  const RiskInfomationDetails({super.key,});



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RiskInfoSubHeadingAndText(
          subheading: 'EDIT RATINGS',
          text: 'Open',
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'PRIORITY',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  // color: (data.priority == '1')
                  //     ? Colors.red
                  //     : (data.priority == '2')
                  //         ? Colors.amber
                  //         : (data.priority == '3')
                  //             ? Colors.blue
                  //             : Colors.green,
                  borderRadius: BorderRadius.circular(50)),
            ),
          ]),
        ),
        // RiskInfoSubHeadingAndText(subheading: 'RISK ID', text: data.riskId),
        // RiskInfoSubHeadingAndText(subheading: 'RISK', text: data.riskName),
        // RiskInfoSubHeadingAndText(
        //     subheading: 'RISK DESCRIPTION', text: data.riskDescription),
        // RiskInfoSubHeadingAndText(
        //   subheading: 'RISK OWNER',
        //   text: data.riskOwner,
        // ),
        // RiskInfoSubHeadingAndText(
        //   subheading: 'RISK CATEGORY',
        //   text: data.riskCategory,
        // ),
        // RiskInfoSubHeadingAndText(
        //     subheading: 'DATE IDENTIFIED', text: data.riskDate),
        // RiskInfoSubHeadingAndText(
        //   subheading: 'DIVISION',
        //   text: data.riskOwnerDepartment,
        // ),
        const RiskInfoSubHeadingAndText(
          subheading: 'STRATEGIC OBJECTIVE',
          text: 'Employee engagement and retention',
        ),
        const RiskInfoSubHeadingAndText(
          subheading: 'THREAT / OPPORTUNITY',
          text: 'Threat',
        ),
        const RiskInfoSubHeadingAndText(
          subheading: 'INHERENT LIKELIHOOD VALUE',
          text: '4',
        ),
        const RiskInfoSubHeadingAndText(
          subheading: 'INHERENT IMPACT VALUE',
          text: '4',
        ),
        const RiskInfoSubHeadingAndText(
          subheading: 'INHERENT RISK LEVEL',
          text: '10',
        ),
      ],
    );
  }
}

class SelectPrioRity extends StatefulWidget {
  const SelectPrioRity({super.key});

  @override
  State<SelectPrioRity> createState() => _SelectPrioRityState();
}

class _SelectPrioRityState extends State<SelectPrioRity> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue,
      items: items,
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      isExpanded: true,
      hint: const Text('Set Risk Priority'),
      disabledHint: const Text('Set Risk Priority'),
      alignment: Alignment.bottomCenter,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black87),
      underline: Container(
        height: 2,
        color: Colors.transparent,
      ),
    );
  }
}
