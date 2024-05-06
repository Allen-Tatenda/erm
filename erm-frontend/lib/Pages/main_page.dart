import 'package:erm/Auth/splash_screen.dart';
import 'package:erm/Pages/homepage/responsive.dart';
import 'package:erm/Pages/homepage/widgets/app_bar.dart';
import 'package:erm/Pages/riskRegister/loss_of_key_employee/loss_of_key_employee.dart';
import 'package:erm/Pages/riskRegister/risk_register.dart';
import 'package:erm/Pages/settings/settings.dart';
import 'package:erm/widgets/navigation_method.dart';
import 'package:erm_logic/auth/auth_controller.dart';
import 'package:flutter/material.dart';

class Entrance extends StatefulWidget {
  const Entrance({super.key});

  @override
  State<Entrance> createState() => _EntranceState();
}

    int activeTab = 0;
  final List _barWidgets = [
   const HomePageResponsive(),
   const RiskRegisterPage(),
   const LossOfKeyEmployee(),
  ];
  List myPages = [
  "HOME", 
 "RISK REGISTER",
 "Loss of Key Employee"
  ];

class _EntranceState extends State<Entrance> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const AppBarWidget(),
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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(
             height: MediaQuery.of(context).size.height-100,
              child: _buildPage()
              ),
          ],
        ),
      ),
           drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  //image: DecorationImage(image: NetworkImage(''))
                ),
                child: Text(
                  'App Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                       width: MediaQuery.of(context).size.width,
                        height: 300,
                      child: ListView.builder(
                        itemCount: myPages.length,
                        itemBuilder: (context, index) {
                          if(index == 2){
                            return const SizedBox.shrink();
                          }
                          return  ListTile(
                            leading: SizedBox(
                              width: 20,
                              child: Image.asset('assets/icons/logo-transparent.png')),
                        title: Text(myPages[index]),
                        onTap: () {
                          activeTab = index;
                          setState(() {
                        activeTab = index;
                      });
                        },
                      );
                        },),
                    ),

                    Column(
                      children: [
                        ListTile(
                                leading: const Icon(Icons.settings,size: 25,color: Colors.blue,),
                            title: const Text('SETTINGS'),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingsPage()));
                            },
                          ),
                        ListTile(
                                leading: const Icon(Icons.logout,size: 25,color: Colors.blue,),
                            title: const Text('SIGNOUT'),
                            onTap: () {
                              setState(() {
                            AuthController().logout(context,const SplashScreen());
                          });
                            },
                          ),
                      ],
                    ),
                    const Text('Copyright 2024 GRC',style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ),
            ],
          ),
          
        ),
        );
       
    
  }
  
Widget _buildPage() {
    return StreamBuilder(
      stream: navigationStream.stream,
      builder: (context, snapshot) {
        return IndexedStack(
          index: activeTab,
          children: List.generate(
            _barWidgets.length,
            (index) => _barWidgets[index],
          ),
        );
      }
    );
  }
 }