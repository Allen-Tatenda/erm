import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Fixed Column')),
          DataColumn(label: Text('Column A')),
          DataColumn(label: Text('Column B')),
          DataColumn(label: Text('Column C')),
          DataColumn(label: Text('Column D')),
          DataColumn(label: Text('Column E')),
          DataColumn(label: Text('Last Fixed Column'))
        ],
        rows:[
           DataRow(cells:[
             DataCell(Text("Data")),
             DataCell(Text("Data")),
             DataCell(Text("Data")),
             DataCell(Text("Data")),
             DataCell(Text("Data")),
             DataCell(Text("Data")),
             DataCell(Text("Data")),
            ]),
            // Add more data rows as needed
       ]
        
         
      
     
     ));
    
}
}