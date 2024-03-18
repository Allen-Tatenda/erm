import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:flutter/material.dart';

class RiskReports extends StatefulWidget {
  const RiskReports({super.key, required this.widgetHeader});
  final String widgetHeader;
  @override
  State<RiskReports> createState() => _RiskReportsState();
}

class _RiskReportsState extends State<RiskReports> {
  final List<Map<String, String>> _data = [
    {
      "RiskID": "RI10021",
      "Priority": "0",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Olivia Davis"
    },
    {
      "RiskID": "RI10321",
      "Priority": "1",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Becky Dawn"
    },
    {
      "RiskID": "RI15021",
      "Priority": "2",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Lenny Browski"
    },
    {
      "RiskID": "RI10021",
      "Priority": "0",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Olivia Davis"
    },
    {
      "RiskID": "RI10321",
      "Priority": "1",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Becky Dawn"
    },
    {
      "RiskID": "RI15021",
      "Priority": "2",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Lenny Browski"
    },
    {
      "RiskID": "RI10021",
      "Priority": "0",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Olivia Davis"
    },
    {
      "RiskID": "RI10321",
      "Priority": "1",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Becky Dawn"
    },
    {
      "RiskID": "RI15021",
      "Priority": "2",
      "Risk": "liquidity Risk",
      "Risk Description":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      "Risk Owner": "Lenny Browski"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      width: 420,
      height: 222,
      child: Card(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, left: 0, right: 8.0, bottom: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      widget.widgetHeader,
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.grey.shade600,
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey.shade600,
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.grey.shade600,
                        ),
                        const DropDownListTile()
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(width: 1, color: Colors.black12),
                    borderRadius: BorderRadius.circular(4)),
                width: 420,
                height: 160,
                child: SingleChildScrollView(
                  child: DataTable(
                    decoration: const BoxDecoration(color: Colors.white70),
                    // Columns definition
                    columns: const [
                      DataColumn(
                          label: Text(
                        'NAME ',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.grey,
                            fontSize: 14),
                      )),
                      DataColumn(
                          label: Text(
                        'DOWNLOAD',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.grey,
                            fontSize: 14),
                      )),
                    ],
                    // Rows definition
                    rows: _data
                        .asMap()
                        .entries
                        .map((entry) => DataRow(
                              cells: [
                                DataCell(Text(entry.value['RiskID']!)),
                                const DataCell(Row(
                                  children: [
                                    Icon(
                                      Icons.document_scanner,
                                      color: Colors.black54,
                                    ),
                                    Icon(
                                      Icons.picture_as_pdf,
                                      color: Colors.black54,
                                    )
                                  ],
                                )),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
