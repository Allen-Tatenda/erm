import 'package:flutter/material.dart';

class BusinessEntitiesTable extends StatelessWidget {
  BusinessEntitiesTable({
    super.key,
    required this.data,
  });

  final List<Map<String, String>> data;
     List<DataRow> rows = [];
  Future getdata()async{

          for (var data in data){
   
            DataRow row =  tableRow(
              data,
              data['name'],
              data['lastname'],
              data['email'],
              data['department'],
              data["designation"],
              data["id"],
              );
            rows.add(row);
          }
          
  }

  @override
  Widget build(BuildContext context) {       

           return FutureBuilder(
            future: getdata(),
             builder: (context,snapshot) {
              if(snapshot.hasData){
               return Column(
                mainAxisSize: MainAxisSize.max,
                 children: [
                   SizedBox(
                    width: double.infinity,
                     child: DataTable(
                      showCheckboxColumn: true,
                       decoration: const BoxDecoration(color: Colors.white70),
                       // Columns definition
                       columns: const [
                         DataColumn(
                                label: Text(
                              'Firstname',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey,
                                  fontSize: 14),
                         )),
                         DataColumn(
                                label: Text(
                              'Lastname',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey,
                                  fontSize: 14),
                         )),
                         DataColumn(
                                label: Text(
                              'Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey,
                                  fontSize: 14),
                         )),
                         DataColumn(
                                label: Text(
                              'Department',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey,
                                  fontSize: 14),
                         )),
                         DataColumn(
                                label: Text(
                              'Position',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.grey,
                                  fontSize: 14),
                         )),
                        
                       ],
                       // Rows definition
                       rows: rows,
                                
                     ),
                   ),
               
               
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Total # of users : ${rows.length}",style: const TextStyle(color: Colors.black54),),
                  )
               
                 ],
               );}
               return SizedBox.shrink();
             }
           );
  }

  DataRow tableRow(data,firstname,lastname,email,department,position,id) {
    return DataRow(
                  cells: [
                    DataCell(Text(firstname.toString(), style: const TextStyle(fontSize: 12),)),
                    DataCell(Text(lastname.toString(), style: const TextStyle(fontSize: 12),)),
                    DataCell(InkWell(
                      onTap: (){
                        //print(data);
                      },
                      child: Text(
                        email.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    )),
                    DataCell(SizedBox(
                      width: 210,
                      child: Text(
                        department.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    )),
                    DataCell(Text(
                      position.toString(),
                      style: const TextStyle(fontSize: 12),
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