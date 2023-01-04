// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:community_dev/constants/style.dart';

// class joinTeam extends StatefulWidget {
//   const joinTeam({super.key});

//   @override
//   State<joinTeam> createState() => _joinTeamState();
// }

// class _joinTeamState extends State<joinTeam> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


// void showCustomDialog(BuildContext context, String message) {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext cxt) {
//         return Align(
//           alignment: Alignment.topCenter,
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: Material(
//               color: Colors.green,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15)),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       children: [
//                         InkWell(
//                             onTap: () {
//                               Navigator.of(context).pop();
//                             },
//                             child: Image.asset("assets/close.png")),
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Text(
//                             message,
//                             style: TextStyle(
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }