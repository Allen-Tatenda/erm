import 'package:erm/Pages/settings/widgets/set_password_screen.dart';
import 'package:flutter/material.dart';

class PasswordSettings extends StatelessWidget {
  const PasswordSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
            children: [
              const SizedBox(height: 16,),
              Container(
                width: MediaQuery.of(context).size.width -280,
                 decoration:  BoxDecoration(color: Colors.white,
                 borderRadius: BorderRadius.circular(8),
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
       children: [
         Container(
                width: MediaQuery.of(context).size.width -280,
                 decoration:  const BoxDecoration(
      color: Color.fromARGB(26, 2, 82, 143),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                 
                 ),
                 child:  const Padding(
       padding: EdgeInsets.all(14.0),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text("Password Settings",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black),),
         ],
       ),
                 ),
      
         ),
         Row(
          children: [
           
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(child: Text("Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                           Expanded(child: Text("Njiva Allen Tatenda",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                      ],
                      ),
                      Divider(color: Colors.black.withOpacity(.1),),
                       const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(child: Text("Username:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                           Expanded(child: Text("whyteeonit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                      ],
                      ),
                       
                         Divider(color: Colors.black.withOpacity(.1),),
                       const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(child: Text("Email:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                          Expanded(child: Text("anjiva7@gmail.com",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                      ],
                      ),
                        Divider(color: Colors.black.withOpacity(.1),),
                       const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(child: Text("Phone:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                           Expanded(child: Text("+263 772 504 909",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                      ],
                      ),
                       Divider(color: Colors.black.withOpacity(.1),),
                       Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(child: Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                           Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text("****************",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),
                               ),
                                        InkWell(
                                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetPasswordScreen())),
                                          child: Icon(Icons.edit,size: 25,color: Colors.black26,)
                                        ),
                             ],
                           ))         
                      ],
                      ),
                        ],
                      ),
                    ),
                  )
          ],
         ),
       ],
                 ),
              ),
              const SizedBox(height: 20,),
               Container(
                width: MediaQuery.of(context).size.width -280,
                 decoration:  BoxDecoration(color: Colors.white,
                 borderRadius: BorderRadius.circular(8),
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
       children: [
         Container(
                width: MediaQuery.of(context).size.width -280,
                 decoration:  const BoxDecoration(
      color: Color.fromARGB(26, 2, 82, 143),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                 
                 ),
                 child:  const Padding(
       padding: EdgeInsets.all(14.0),
       child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text("Multi-Factor Authentication",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black),),
         Icon(Icons.edit,size: 25,color: Colors.black,),
         ],
       ),
                 ),
      
         ),
         Row(
          children: [
           
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(child: Text("SMS:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                           Expanded(child: Text("Inactive",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                      ],
                      ),
                      Divider(color: Colors.black.withOpacity(.1),),
                       const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(child: Text("Calls:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                           Expanded(child: Text("263 772 504 909",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                      ],
                      ),
                       
                         Divider(color: Colors.black.withOpacity(.1),),
                       const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Expanded(child: Text("Email:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                          Expanded(child: Text("anjiva7@gmail.com",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                      ],
                      ),
                        ],
                      ),
                    ),
                  )
          ],
         ),
       ],
                 ),
              ),
      
            ],
          ),
    );
  }
  }