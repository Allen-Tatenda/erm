import 'package:erm/widgets/loading.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:erm_logic/risk_register/risk_register_repository.dart';
import 'package:flutter/material.dart';

import '../../../../../../../widgets/dropdown_list_tile.dart';

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

  TextEditingController riskImpactController = TextEditingController();
  TextEditingController riskExposureController = TextEditingController();

  @override
  void initState() {
    super.initState();
    RiskRegisterRepository().getRiskRating();
  }


  @override
  Widget build(BuildContext context) {
   return StreamBuilder(
    stream: riskRatingController.stream, 
   builder: (context,snapshot){

    if(snapshot.hasData){
      riskImpactController.text = snapshot.data['risk_impact'].toString();
      riskExposureController.text = snapshot.data['risk_exposure'].toString();
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
    RiskInfoSubHeadingAndText(
        subheading: 'RISK IMPACT (\$)', text:(snapshot.data['risk_impact'] != null)? snapshot.data['risk_impact'].toString():''),
    RiskInfoSubHeadingAndText(
        subheading: 'RISK EXPOSURE (\$)', text:(snapshot.data['risk_exposure'] != null)? snapshot.data['risk_exposure'].toString():''),
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
                InkWell(
                  onTap: ()async{
                  await RiskRegisterRepository().editRiskExposure(context,riskImpactController.text, riskExposureController.text);
                  setState(() {
                        showEditing = false;
                    });
                  },
                  child: const Icon(Icons.done))
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
              SizedBox(
              height: 40,
              child: TextField(
                controller: riskImpactController,
                decoration: const InputDecoration(
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
            SizedBox(
              height: 40,
              child: TextField(
                controller:  riskExposureController,
                decoration: const InputDecoration(
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

    return const LoadingWidget();
   }
   );
  }
}
