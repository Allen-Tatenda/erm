import 'package:flutter/material.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({
    super.key,
  });

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController departmentController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
children: [
  const SizedBox(height: 20,),
    
          const SizedBox(height: 20,),
           Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: firstnameController,
                    decoration: const InputDecoration(
                      hintText: "First Name"
                    ),
                  ),
                )
              ),
               Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: lastnameController,
                     decoration: const InputDecoration(
                      hintText: "Last Name"
                    ),
                  ),
                )
              )
            ],
          ),
          
          const SizedBox(height: 20,),
          
         Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      hintText: "Username"
                    ),
                  ),
                )
              ),
               Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: emailController,
                     decoration: const InputDecoration(
                      hintText: "Email"
                    ),
                  ),
                )
              ),
               Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: phoneController,
                     decoration: const InputDecoration(
                      hintText: "Phone Number",
                      //label: Text('Phone Number')
                    ),
                  ),
                )
              )
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: positionController,
                    decoration: const InputDecoration(
                      hintText: "Position"
                    ),
                  ),
                )
              ),
               Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: departmentController,
                     decoration: const InputDecoration(
                      hintText: "Department"
                    ),
                  ),
                )
              )
            ],
          ),
          const SizedBox(height: 30,),
              InkWell(

                onTap: (){
                 
                },

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
    );
  }
}