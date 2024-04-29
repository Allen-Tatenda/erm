import 'package:erm/Pages/main_page.dart';
import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:flutter/material.dart';

import '../../../widgets/navigation_method.dart';

class RisksTable extends StatefulWidget {
  const RisksTable({
    super.key,
    required List<Map<String, String>> data,
  }) : _data = data;

  final List<Map<String, String>> _data;

  @override
  State<RisksTable> createState() => _RisksTableState();
}

class _RisksTableState extends State<RisksTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 500,
      margin: const EdgeInsets.only(top: 19),
      decoration: BoxDecoration(
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
          rows: widget._data
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
                      DataCell(InkWell(
                        onTap: (){
                            activeTab = 2;
                            navigationStream.sink.add(activeTab);
                        },
                        child: Text(
                          entry.value['Risk']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      )),
                      DataCell(Container(
                        width: 210,
                        child: Text(
                          entry.value['Risk Description']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                      )),
                      DataCell(Text(
                        entry.value['Risk Owner']!,
                        style: const TextStyle(fontSize: 12),
                      )),
                      const DataCell(DropDownListTile()),
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
                  )
                  )
              .toList(),
        ),
      ),
    );
  }
}
