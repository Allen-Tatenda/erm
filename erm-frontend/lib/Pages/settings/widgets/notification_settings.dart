import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({
    super.key,
  });

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
             decoration:  const BoxDecoration(
    color: Color.fromARGB(26, 2, 82, 143),
             borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
             
             ),
             child:  const Padding(
     padding: EdgeInsets.all(14.0),
     child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text("Notification Settings",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800,color:Colors.black),),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                NotificationGroup(notificationHeader: 'Comments', notificationDescription: 'These are notifications for comments on your posts and replies to your comments.',),
                NotificationGroup(notificationHeader: 'Tags', notificationDescription: 'These are notifications for when someone tags you in a post or comment.',),
                NotificationGroup(notificationHeader: 'Reminders', notificationDescription: 'These are notifications to remind you of updates you might have missed.',),
                const SizedBox(height: 60,)
              ],
            ),
          ),
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