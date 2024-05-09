import 'package:flutter/material.dart';

import '../../../../../../widgets/dropdown_list_tile.dart';
import '../../../risk_analysis_and_evaluation/widgets/risk_rating_column/widgets/consequences_header.dart';

class ExistingControlsColum extends StatefulWidget {
  const ExistingControlsColum({super.key, required this.data});
  final List data;

  @override
  State<ExistingControlsColum> createState() => _ExistingControlsColumState();
}

class _ExistingControlsColumState extends State<ExistingControlsColum> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width -472,
      margin: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          const ConsequencesHeader(heading: 'EXISTING CONTROLS'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(width: 1, color: Colors.black12),
                  borderRadius: BorderRadius.circular(4)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                      'CONTROL DESCRIPTION',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                          fontSize: 14),
                    )),
                     DataColumn(
                        label: Text(
                      'CONTROL OWNER',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                          fontSize: 14),
                    )),
                     DataColumn(
                        label: Text(
                      'EFFECTIVENESS',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                          fontSize: 14),
                    )),
                     DataColumn(
                        label: Text(
                      'CONTROL TYPE',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                          fontSize: 14),
                    )),
                    DataColumn(
                        label: Text(
                      '',
                    )),
                  ],
                  // Rows definition
                  rows: widget.data
                      .asMap()
                      .entries
                      .map((entry) => DataRow(
                        
                            cells: [
                              
                              DataCell(SizedBox(
                                 width:( MediaQuery.of(context).size.width -500)/4,
                                child: Text(entry.value['name']!)),),
                              DataCell(SizedBox(
                                width:( MediaQuery.of(context).size.width -500)/4,
                                child: Text(entry.value['description']!))),
                              DataCell(SizedBox(
                                width:( MediaQuery.of(context).size.width -500)/4,
                                child: Text(entry.value['owner']!))),
                              DataCell(
                                SizedBox(
                                   width:( MediaQuery.of(context).size.width -500)/4,
                                  child: Text(entry.value['effectiveness']!))),
                              DataCell(Text(entry.value['control_type']!)),
                              const DataCell(                             
                                DropDownListTile(),
                              ),
                            ],
                            color: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              // Check if the row index is even
                              if (entry.key % 2 == 0) {
                                return Colors.grey[200]!; // Light grey color
                              }
                              return Colors
                                  .white; // Use default color for odd rows (white)
                            }),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}