import 'package:erm/Pages/main_page.dart';
import 'package:flutter/material.dart';

class SetPasswordScreen extends StatelessWidget {
 const SetPasswordScreen({super.key});

 
  @override
  Widget build(BuildContext context) {

  TextEditingController oldPasswordTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController = TextEditingController();
    
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 241, 241),
        appBar: AppBar(
          automaticallyImplyLeading: true,
      title: const Text('Change Password',style: TextStyle(color: Colors.white),),
      iconTheme:  const IconThemeData(color: Colors.white),
       flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ Color.fromARGB(255, 2, 1, 26),Colors.blue,  Color.fromARGB(255, 2, 1, 26),],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
      ),

    body: Center(
        child: SizedBox(
                        width: 400,
                        height: 350,
                        child: Card(
                          elevation: 7,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              const SizedBox(height: 10,),
                              StreamBuilder<String>(
                                stream: null,
                                builder: (context, snapshot) {
                                 if(snapshot.hasData){
                                   return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       Text(snapshot.data.toString(),style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.redAccent
                                        
                                       ),
                                       textAlign: TextAlign.start,
                                       ),
                                     ],
                                   );
                                 }
                                 return const SizedBox.shrink();
                                }
                              ),
                                const SizedBox(height: 10,),
                                  TextField(
                                  obscureText: true,
                                  controller: oldPasswordTextEditingController,
                                decoration: InputDecoration(
                                  hintText: 'Old Password',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                ),
                                                
                                const SizedBox(height: 20,),
                                TextField(
                                  obscureText: true,
                                  controller: passwordTextEditingController,
                                decoration: InputDecoration(
                                  hintText: 'New Password',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                ),
                                                
                                const SizedBox(height: 20,),
                                                
                                TextField(
                                  controller: confirmPasswordTextEditingController,
                                  obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                                ),
                                const SizedBox(height: 20,),
        
        
                                InkWell(
                                  onTap: ()async{
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Entrance()));
                                    },
                                  child: Container(
                                    width: double.infinity,
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
                                    child: const Center(child: Text('Submit',
                                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)
                                    )),
                                  ),
                                ),       
                              ],
                            ),
                          ),
                        ),
                      ),
      )
    );
  }
}