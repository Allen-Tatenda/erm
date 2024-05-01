import 'package:erm/Auth/splash_screen.dart';
import 'package:erm_logic/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SetPasswordScreen extends StatelessWidget {
 SetPasswordScreen({super.key});

  TextEditingController oldPasswordTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
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
                        height: 325,
                        child: Card(
                          elevation: 7,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
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
                                  onTap: (){
                                   if(passwordTextEditingController.text.isNotEmpty &&
                                    confirmPasswordTextEditingController.text.isNotEmpty &&
                                     oldPasswordTextEditingController.text.isNotEmpty){
                                       if(passwordTextEditingController.text == confirmPasswordTextEditingController.text){
                                      AuthController().changePassword(oldPasswordTextEditingController.text,
                                       passwordTextEditingController.text, context, SplashScreen());
                                    }
                                    else{
                                      print('Passwords do not match');
                                    }
                                     }
                                     else{
                                      print('Enter all required fields');
                                     }
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