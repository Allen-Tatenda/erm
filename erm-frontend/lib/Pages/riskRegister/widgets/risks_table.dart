import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:flutter/material.dart';

class RisksTable extends StatelessWidget {
  const RisksTable({
    super.key,
    required List<Map<String, String>> data,
  }) : _data = data;

  final List<Map<String, String>> _data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 500,
      margin: EdgeInsets.only(top: 19),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      child: SingleChildScrollView(
        child: DataTable(
          decoration: BoxDecoration(color: Colors.white70),
          // Columns definition
          columns: const [
            DataColumn(
                label: Text(
              'RISK ID',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  fontSize: 14),
            )),
            DataColumn(
                label: Text(
              'PRIORITY',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  fontSize: 14),
            )),
            DataColumn(
                label: Text(
              'RISK',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  fontSize: 14),
            )),
            DataColumn(
                label: Text(
              'RISK DESCRIPTION',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  fontSize: 14),
            )),
            DataColumn(
                label: Text(
              'RISK OWNER',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey,
                  fontSize: 14),
            )),
            DataColumn(label: Text('')),
          ],
          // Rows definition
          rows: _data
              .asMap()
              .entries
              .map((entry) => DataRow(
                    cells: [
                      DataCell(Text(entry.value['RiskID']!)),
                      DataCell(Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                            color: (entry.value['Priority']! == '0')
                                ? Colors.lightGreen
                                : (entry.value['Priority']! == '1')
                                    ? Colors.yellow
                                    : Colors.red,
                            borderRadius: BorderRadius.circular(50)),
                      )),
                      DataCell(Text(
                        entry.value['Risk']!,
                        style: TextStyle(fontSize: 12),
                      )),
                      DataCell(Text(
                        entry.value['Risk Description']!,
                        style: TextStyle(fontSize: 12),
                      )),
                      DataCell(Text(
                        entry.value['Risk Owner']!,
                        style: TextStyle(fontSize: 12),
                      )),
                      DataCell(DropDownListTile()),
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
    );
  }
}
