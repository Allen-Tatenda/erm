import 'package:erm/widgets/loading.dart';
import 'package:erm_logic/settings/settings_repository.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16,),
          Container(
            height: 300,
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
      
             child: FutureBuilder(
              future: SettingsRepository().getMyProfile(),
               builder: (context,snapshot) {
                if(snapshot.hasData){
                                   return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height:300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network('https://images.pexels.com/photos/4924538/pexels-photo-4924538.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover,
                          ),
                        )),
                    ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                  const Expanded(child: Text("Name:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                                   Expanded(child: Text("${snapshot.data['firstname']} ${snapshot.data['lastname']}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                              ],
                              ),
                              Divider(color: Colors.black.withOpacity(.1),),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                  const Expanded(child: Text("Position:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                                   Expanded(child: Text("${snapshot.data['designation']}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                              ],
                              ),
                                Divider(color: Colors.black.withOpacity(.1),),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                  const Expanded(child: Text("Department:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                                   Expanded(child: Text("${snapshot.data['department']}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
                              ],
                              ),
                                 Divider(color: Colors.black.withOpacity(.1),),
                               Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                  const Expanded(child: Text("Email:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),)),
                                  Expanded(child: Text("${snapshot.data['email']}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black54),))         
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
                                ],
                              ),
                            ),
                          )
                  ],
                 );
                }
                return const LoadingWidget();
               }
             ),
          ),
          const SizedBox(height: 60,),
           Container(
            //height: 300,
            width: MediaQuery.of(context).size.width -280,
             decoration:  BoxDecoration(color: Colors.white,
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
             child:  const Padding(
               padding: EdgeInsets.all(23.0),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.logout,size: 30,color: Colors.black87,),
                            SizedBox(width: 29,),
                        Text("SignOut",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black87),),
                          ],
                          ),
                          SizedBox(height: 30,),
                           Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.delete,size: 30,color: Colors.red,),
                            SizedBox(width: 29,),
                        Text("Delete Account",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.red),),
                          ],
                          ),
                 ],
               ),
             ),
           )
        ],
      ),
    );
  }
}