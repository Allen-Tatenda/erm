import 'package:erm/Pages/riskRegister/single_risk_details/risk_analysis_and_evaluation/widgets/risk_rating_column/widgets/consequences_header.dart';
import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:flutter/material.dart';

class Consequences extends StatelessWidget {
  const Consequences({
    super.key,
    required this.data,
  });

  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          const ConsequencesHeader(heading: 'CONSEQUENCES'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                      'CONSEQUENCE DESCRIPTION',
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
                  rows: data
                      .asMap()
                      .entries
                      .map((entry) => DataRow(
                            cells: [
                              DataCell(Text(entry.value['name']!)),
                              DataCell(Text(entry.value['description']!)),
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
