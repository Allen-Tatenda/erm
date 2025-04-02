// import 'package:erm/Pages/homepage/widgets/app_bar.dart';
// import 'package:erm/Pages/riskRegister/single_risk_details/contained_tab_bar.dart';
// import 'package:erm/widgets/dropdown_list_tile.dart';
// import 'package:flutter/material.dart';

// class SingleRiskDetails extends StatefulWidget {
//   const SingleRiskDetails({super.key,required this.data});

//   final data;

//   @override
//   State<SingleRiskDetails> createState() => _SingleRiskDetailsState();
// }

// class _SingleRiskDetailsState extends State<SingleRiskDetails> {
//   @override
//   Widget build(BuildContext context) {

// return  Scaffold(
//         appBar: AppBar(
//       title: const AppBarWidget(),
//       iconTheme:  const IconThemeData(color: Colors.white),
//        flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [ Color.fromARGB(255, 2, 1, 26),Colors.blue,  Color.fromARGB(255, 2, 1, 26),],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//           ),
//       ),
//             body: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: Column(
//             children: [
//               const SizedBox(height: 10,),
//               Padding(
//                 padding: const EdgeInsets.only(left: 45),
//                 child: Row(
//                   children: [
//                     Text(
//                       widget.data['risk_name'],
//                       style: const TextStyle(
//                           fontSize: 36,
//                           fontFamily: 'BebasNeue',
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     const DropDownListTile()
//                   ],
//                 ),
//               ),
//               const LossOfKeyContainedTabBar()
//             ],
//           ),
//         )
//           );
//         }
//   }
