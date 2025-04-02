// import 'package:erm/Pages/riskRegister/single_risk_details/single_risk_details.dart';
// import 'package:flutter/material.dart';


// class RisksTable extends StatefulWidget {
//   const RisksTable({
//     super.key,
//   });



//   @override
//   State<RisksTable> createState() => _RisksTableState();
// }

// class _RisksTableState extends State<RisksTable> {
//   List<Map<String, dynamic>> data = [
//     {'risk_id': 'RSK1230', 'priority': '1', 'risk_name': 'Risk Name', 'risk_description': 'Risk Description', 'risk_owner': {'firstname': 'John', 'lastname': 'Doe'}, 'id': 1},
//     {'risk_id': 'RSK2202', 'priority': '2', 'risk_name': 'Risk Name', 'risk_description': 'Risk Description', 'risk_owner': {'firstname': 'Lucy', 'lastname': 'Doe'}, 'id': 2},
//     {'risk_id': 'RSK1433', 'priority': '3', 'risk_name': 'Risk Name', 'risk_description': 'Risk Description', 'risk_owner': {'firstname': 'Marcus', 'lastname': 'Doe'}, 'id': 3},
//     {'risk_id': 'RSK1833', 'priority': '4', 'risk_name': 'Risk Name', 'risk_description': 'Risk Description', 'risk_owner': {'firstname': 'Marcus', 'lastname': 'Doe'}, 'id': 4},
//     {'risk_id': 'RSK1123', 'priority': '5', 'risk_name': 'Risk Name', 'risk_description': 'Risk Description', 'risk_owner': {'firstname': 'Terry', 'lastname': 'Doe'}, 'id': 5}
//   ];
//           List<DataRow> rows = [];
          
//           @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     for (var data in data){
   
//             DataRow row =  tableRow(
//               data,
//               data['risk_id'],
//               data['priority'],
//               data['risk_name'],
//               data['risk_description'],
//               '${data["risk_owner"]["firstname"]} ${data["risk_owner"]["lastname"]}',
//               data['id']
//               );
//             rows.add(row);
//           }

//           //totalRisks.sink.add(rows.length);
//   }
  

//   @override
//   Widget build(BuildContext context) {
    
//     return  Container(
//                  //width: MediaQuery.of(context).size.width ,
//                  margin: const EdgeInsets.only(top: 19),
//                  decoration: BoxDecoration(
//                      border: Border.all(width: 1, color: Colors.black12),
//                      borderRadius: BorderRadius.circular(4)),
//                  child: SingleChildScrollView(
//                    scrollDirection: Axis.horizontal,
//                    child: DataTable(
//                     showCheckboxColumn: true,
//                      decoration: const BoxDecoration(color: Colors.white70),
//                      // Columns definition
//                      columns: const [
//                        DataColumn(
//              label: Text(
//            'RISK ID',
//            style: TextStyle(
//                fontWeight: FontWeight.w900,
//                color: Colors.grey,
//                fontSize: 14),
//                        )),
//                        DataColumn(
//              label: Text(
//            'PRIORITY',
//            style: TextStyle(
//                fontWeight: FontWeight.w900,
//                color: Colors.grey,
//                fontSize: 14),
//                        )),
//                        DataColumn(
//              label: Text(
//            'RISK',
//            style: TextStyle(
//                fontWeight: FontWeight.w900,
//                color: Colors.grey,
//                fontSize: 14),
//                        )),
//                        DataColumn(
//              label: Text(
//            'RISK DESCRIPTION',
//            style: TextStyle(
//                fontWeight: FontWeight.w900,
//                color: Colors.grey,
//                fontSize: 14),
//                        )),
//                        DataColumn(
//              label: Text(
//            'RISK OWNER',
//            style: TextStyle(
//                fontWeight: FontWeight.w900,
//                color: Colors.grey,
//                fontSize: 14),
//                        )),
                      
//                      ],
//                      // Rows definition
//                      rows: rows,
             
//                    ),
//                  ),
//                );    
//   }

//   DataRow tableRow(data,riskId,priority,name,description,owner,id) {
//     return DataRow(
//                   cells: [
//                     DataCell(Text(riskId.toString(), style: const TextStyle(fontSize: 12),)),
//                     DataCell(
//                       Container(
//                       width: 15,
//                       height: 15,
//                       decoration: BoxDecoration(
//                           color:( priority =='1')?Colors.red:(priority =='2')?Colors.amber:( priority =='3')?Colors.blue:Colors.green,
//                           borderRadius: BorderRadius.circular(50)),
//                     )),
//                     DataCell(InkWell(
//                       onTap: (){
//                         setState(() {
                          
//                         });

//                         Navigator.push(context, MaterialPageRoute(builder: ((context) =>  SingleRiskDetails(data: data,))));
//                       },
//                       child: Text(
//                         name.toString(),
//                         style: const TextStyle(fontSize: 12),
//                       ),
//                     )),
//                     DataCell(SizedBox(
//                       width: 210,
//                       child: Text(
//                         description.toString(),
//                         style: const TextStyle(fontSize: 12),
//                       ),
//                     )),
//                     DataCell(Text(
//                       owner.toString(),
//                       style: const TextStyle(fontSize: 12),
//                     )),
//                   ],
//                   color: MaterialStateProperty.resolveWith<Color>(
//                       (Set<MaterialState> states) {
//                     // Check if the row index is even
//                     if (id % 2 == 0) {
//                       return Colors.grey[200]!; // Light grey color
//                     }
//                     return Colors
//                         .white; // Use default color for odd rows (white)
//                   }),
//                 );
//   }
// }
