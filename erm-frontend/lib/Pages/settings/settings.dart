import 'package:erm/Pages/settings/widgets/user_settings.dart';
import 'package:erm/Pages/settings/widgets/my_profile_page.dart';
import 'package:erm/Pages/settings/widgets/password_settings.dart';
import 'package:erm_logic/helpers/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/notification_settings.dart';

class SettingsPage extends StatefulWidget {
   SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
int activeTab = 0;

List<Widget> settingsPages = [const MyProfilePage(),const NotificationSettings(),const PasswordSettings(), const AllUsersPage()];

  Color tileColor = Colors.black54;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 241, 241),
        appBar: AppBar(
          automaticallyImplyLeading: true,
      title: const Text('Settings',style: TextStyle(color: Colors.white),),
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
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
 SizedBox(
                width: 250,
                height: MediaQuery.of(context).size.height -60,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(10, 16, 0, 0),
                              child: Text('PERSONAL',style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w800),),
                            ),
                            ListTile(
                              onTap: (){
                                 setState(() {
                                activeTab = 0;
                                    });
                                settingsPageController.sink.add(0);
                    
                              },
                              selectedTileColor: const Color.fromARGB(26, 2, 82, 143),
                              selected:(activeTab == 0)? true:false,
                              leading: Icon(Icons.person,size: 22,color:tileColor),
                              title: const Text('My Profile',style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600),),
                            ),
                             ListTile(
                               onTap: (){
                                 setState(() {
                                activeTab = 1;
                                    });
                                settingsPageController.sink.add(1);
                    
                              },
                              selectedTileColor: const Color.fromARGB(26, 2, 82, 143),
                              selected:(activeTab == 1)? true:false,
                              leading: Icon(Icons.notifications,size: 22,color:tileColor),
                              title: const Text('Notifications',style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600),),
                            )
                          ],
                        ),
                         Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(10, 16, 0, 0),
                          child: Text('Account',style: TextStyle(color: Colors.black54,fontSize: 16,fontWeight: FontWeight.w800),),
                        ),
                        ListTile(
                          onTap: (){
                                 setState(() {
                                activeTab = 2;
                                    });
                                settingsPageController.sink.add(2);
                    
                              },
                              selectedTileColor: const Color.fromARGB(26, 2, 82, 143),
                              selected:(activeTab == 2)? true:false,
                         
                          leading: Icon(Icons.lock,size: 22,color:tileColor),
                          title: const Text('Security',style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600),),
                        ),
                         ListTile(
                           onTap: (){
                                 setState(() {
                                activeTab = 3;
                                    });
                                settingsPageController.sink.add(3);
                              },
                               selectedTileColor: const Color.fromARGB(26, 2, 82, 143),
                              selected:(activeTab == 3)? true:false,
                          leading: Icon(Icons.precision_manufacturing,size: 22,color:tileColor),
                          title: const Text('Preferences',style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600),),
                        )
                      ],
                    ),
                      ],
                    ),
                   
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        ListTile(
                          leading: Icon(Icons.headphones,size: 22,color:tileColor),
                          title: const Text('Support',style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600),),
                        ),
                         ListTile(
                          leading: Icon(Icons.document_scanner,size: 22,color:tileColor),
                          title: const Text('Documentation',style: TextStyle(color: Colors.black54,fontSize: 14,fontWeight: FontWeight.w600),),
                        )
                      ],
                    ),
                  ],
                ),
              ),
          Expanded(
            child: StreamBuilder<int>(
              stream: settingsPageController.stream,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return settingsPages[snapshot.data!];
                }
                return settingsPages[0];
              }
            )
          )
        ],
      ),
    );
  }
}




