import 'package:erm/widgets/shimmer_box.dart';
import 'package:erm_logic/risk_register/single_risk_repository.dart';
import 'package:flutter/material.dart';

TextEditingController nameController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
class RiskCausesWidget extends StatefulWidget {
  const RiskCausesWidget({
    super.key,
  });
  @override
  State<RiskCausesWidget> createState() => _RiskCausesWidgetState();
}

class _RiskCausesWidgetState extends State<RiskCausesWidget> {

  bool showEditing = false;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SingleRiskRepository().getRiskCausesByRiskId(),
      builder: (context,snapshot) {

         if(snapshot.connectionState == ConnectionState.waiting){
           return const Center(child: ShimmerBoxWidget(height: 180,));
         } else if(snapshot.hasError){
           return const Center(child :Text('Error occured while loading, Please check your network settings.'));
         }
      else{
          return Container(
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
                  (showEditing==false)?'RISK CAUSES':'ADD RISK CAUSE',
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
                        Icons.add,
                        color: Color.fromARGB(255, 0, 22, 39),
                      ),
                    ):Row(
                      children: [
                        InkWell(
                      onTap: ()async{
                         await SingleRiskRepository().addRiskCause(context,nameController.text,descriptionController.text);
                        setState((){
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
                    Positioned(child: RiskCausesTable(data: snapshot.data)),
                    Visibility(
                      visible: showEditing,
                      child: const AddRiskCauses()
                      )
                  ],
                ),
              ),
            ],
          ),
        );
}
      }
    );
  }
}

class AddRiskCauses extends StatelessWidget {
  const AddRiskCauses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 180,
        color: Colors.white,
        child:  Column(children: [
         TextField(
          controller: nameController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent,width: .1)
                  ),
                label: const Text('Risk Cause'),
                border: InputBorder.none,
                 filled: true,
                fillColor: const Color.fromARGB(8, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 5,),
          Expanded(
            child: TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.transparent,width: .1)
                  ),
                label: const Text('Risk Cause Description'),
                border: InputBorder.none,
                 filled: true,
                fillColor: const Color.fromARGB(8, 0, 0, 0),
              ),
            ),
          )
        ],),
      )
    );
  }
}

class RiskCausesTable extends StatelessWidget {
  const RiskCausesTable({
    super.key,
    required this.data,
  });

  final  data;

  @override
  Widget build(BuildContext context) {
     List<DataRow> rows = [];
          for (var item in data){
   
            DataRow row =  tableRow(
              item,
              item['cause'],
              item['description'],
              item['id']
              );
            rows.add(row);
          }
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      height: 160,
      child: SingleChildScrollView(
        child: DataTable(
          decoration: const BoxDecoration(color: Colors.white70),
          // Columns definition
          columns: const [
            DataColumn(
                label: Text(
              'NAME',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  fontSize: 14),
            )),
            DataColumn(
                label: Text(
              'DESCRIPTION',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  fontSize: 14),
            )),
          ],
          // Rows definition
          rows:rows
        ),
      ),
    );
  }

  DataRow tableRow(data,name,description,id) {
    return DataRow(
                  cells: [
                    DataCell(InkWell(
                      onTap: (){
                    
                      },
                      child: Text(
                        name.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    )),
                    DataCell(SizedBox(
                      width: 210,
                      child: Text(
                        description.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    )),
                   
                  ],
                  color: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    // Check if the row index is even
                    if (id % 2 == 0) {
                      return Colors.grey[200]!; // Light grey color
                    }
                    return Colors
                        .white; // Use default color for odd rows (white)
                  }),
                );
  }
}
