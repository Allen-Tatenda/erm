import 'package:erm/Pages/riskRegister/loss_of_key_employee/risk_analysis_and_evaluation/widgets/risk_rating_column/widgets/consequences_header.dart';
import 'package:erm/widgets/dropdown_listTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({
    super.key,
  });


  @override
  State<AllUsersPage> createState() => _AllUsersPageState();
}

class _AllUsersPageState extends State<AllUsersPage> {

      final List<Map<String, String>> data = [
    {
      "name": "Njiva Allen Tatenda",
      "department":
          "Stores",
    "position": "Floor Supervisor",
    "email": "anjiva7@gmail.com",
    },
     {
      "name": "Emily Musindo",
      "department":
          "Manufacturing",
    "position": "Plant Operator",
    "email": "emily361@gmail.com",
    },
   
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 16,),
          Container(
            height: MediaQuery.of(context).size.height - 72,
            width: MediaQuery.of(context).size.width -280,
             decoration:  BoxDecoration(color: Colors.white,
             borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
    boxShadow: [
        BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset:
            const Offset(0, 3),
        ),
      ],
             ),
        
             child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
     children: [
          Container(
            width: MediaQuery.of(context).size.width -280,
             decoration:   const BoxDecoration(
    color: Color.fromARGB(26, 2, 82, 143),
             borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
             
             ),
             child:  const Padding(
     padding: EdgeInsets.all(14.0),
     child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text("User Settings",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black),),
       ],
     ),
             ),
    
       ),
  Expanded(
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
      width: MediaQuery.of(context).size.width -472,
      margin: const EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.circular(4)),
      child:  Stack(
        children: [
          //AllUsersTable(data: data),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "First Name"
                          ),
                        ),
                      )
                    ),
                     Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                           decoration: InputDecoration(
                            hintText: "Last Name"
                          ),
                        ),
                      )
                    )
                  ],
                ),

                const SizedBox(height: 20,),

              const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Username"
                          ),
                        ),
                      )
                    ),
                     Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                           decoration: InputDecoration(
                            hintText: "Email"
                          ),
                        ),
                      )
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                const Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Position"
                          ),
                        ),
                      )
                    ),
                     Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                           decoration: InputDecoration(
                            hintText: "Department"
                          ),
                        ),
                      )
                    )
                  ],
                ),
                const SizedBox(height: 30,),
                    InkWell(
                              
                                child: Container(
                                  width: 300,
                                  height: 55,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color.fromARGB(255, 2, 1, 26),
                                      Colors.blue,
                                      Color.fromARGB(255, 2, 1, 26)
                                    ]),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset:
                                            const Offset(0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: const Center(child: Text('Add User',
                                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)
                                  )),
                                ),
                              ),
              ],
            )
          )
        ],
      ),
    )
        ),
      )
          ],
         ),
  ),
     ],
             ),
          ),
    
        ],
        );
  }
}

class AllUsersTable extends StatelessWidget {
  const AllUsersTable({
    super.key,
    required this.data,
  });

  final List<Map<String, String>> data;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const ConsequencesHeader(heading: 'All Users'),
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
                      'DEPARTMENT',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                          fontSize: 14),
                    )),
                     DataColumn(
                        label: Text(
                      'POSITION',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                          fontSize: 14),
                    )),
                     DataColumn(
                        label: Text(
                      'EMAIL',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.grey,
                          fontSize: 14),
                    )),
                  ],
                  // Rows definition
                  rows: data
                      .asMap()
                      .entries
                      .map((entry) => DataRow(
                        
                            cells: [
                              
                              DataCell(SizedBox(
                                 width:( MediaQuery.of(context).size.width -500)/4,
                                child: Text(entry.value['name']!)),),
                              DataCell(SizedBox(
                                width:( MediaQuery.of(context).size.width -500)/4,
                                child: Text(entry.value['department']!))),
                              DataCell(SizedBox(
                                width:( MediaQuery.of(context).size.width -500)/4,
                                child: Text(entry.value['position']!))),
                              DataCell(
                                SizedBox(
                                   width:( MediaQuery.of(context).size.width -500)/4,
                                  child: Text(entry.value['email']!))),
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

class NotificationGroup extends StatelessWidget {
   NotificationGroup({
    super.key,
    required this.notificationHeader,
    required this.notificationDescription
  });

  final notificationHeader;
  final notificationDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Divider(height: 50,thickness: .3,color: Colors.black26,),
     Row(
      crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
         Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(notificationHeader,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color:Colors.black54),),
            Text(notificationDescription,
            style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color:Colors.black54),),
          ],
        )),
         Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                Switch.adaptive(value: true, onChanged: (e){
                  e = !e;
                }
                
                ),
                 const Text("Push",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color:Colors.black54),),
               ],
             ),
               Row(
               children: [
                Switch.adaptive(value: false, onChanged: (e){
                  e = !e;
                }
                ),
                 const Text("Email",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color:Colors.black54),),
               ],
             ),
               Row(
               children: [
                Switch.adaptive(value: true, onChanged: (e){
                  e = !e;
                }
                ),
                 const Text("SMS",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w800,color:Colors.black54),),
               ],
             ),
           ],
         ))         
    ],
    ),
    
      ],
    );
  }
}