import 'package:erm/Auth/splash_screen.dart';
import 'package:erm_logic/auth/auth_controller.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
 LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextEditingController = TextEditingController();

    TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/img/bg.jpg',
            fit: BoxFit.cover,
          )),
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [ Colors.transparent,Color.fromARGB(238, 233, 232, 232),Color.fromARGB(238, 233, 232, 232)], stops: [0,0.5, 1])
                    ),
          )),
          Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/icons/logo-transparent.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enterprise Risk Management',
                      style: TextStyle(
                          color: Colors.lightBlue.shade900,
                          fontSize: 22,
                          fontWeight: FontWeight.w800),
                    ),
                    const Text(
                      'ERM Demo V1.0.0',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   
                      const SizedBox(height: 20,),
                    SizedBox(
                      width: 400,
                      height: 302,
                      child: Card(
                        elevation: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StreamBuilder<String>(
                                stream: loginError.stream,
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
                                
                                controller: emailTextEditingController,
                              decoration: InputDecoration(
                                hintText: 'Email',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              ),
                                              
                              const SizedBox(height: 20,),
                                              
                              TextField(
                                controller: passwordTextEditingController,
                                obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              ),
                              const SizedBox(height: 20,),


                              InkWell(
                                onTap: (){
                                  AuthController().login(emailTextEditingController.text,passwordTextEditingController.text,context,const SplashScreen());
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
                                  child: const Center(child: Text('Login',
                                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)
                                  )),
                                ),
                              ),
          
                              const SizedBox(height: 20,),

                              const Text('Forgot Password?',style: TextStyle(color: Colors.blue),)


                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
