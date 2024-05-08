import 'package:erm/Pages/settings/widgets/add_user_page.dart';
import 'package:erm/Pages/settings/widgets/all_users_table.dart';
import 'package:flutter/material.dart';

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
  bool showAddUser = false;
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
    child: Padding(
     padding: const EdgeInsets.all(14.0),
     child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         const Text("User Settings",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black),),
         Row(
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  
                });
              },
              child: Icon(Icons.refresh, color: Colors.grey.shade600,)),
            const SizedBox(width: 10,),
            Icon(Icons.search, color: Colors.grey.shade600,),
            const SizedBox(width: 10,),
            InkWell(
              onTap: (){
                setState(() {
                  showAddUser = !showAddUser;
                });
              },
              child: (showAddUser == false )?Icon(Icons.add, color: Colors.grey.shade600,):Icon(Icons.close, color: Colors.grey.shade600,)
              
              )
          ],
         )
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
      child: (showAddUser == false)?AllUsersTable(data: data):const AddUserView()

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




