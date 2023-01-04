import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_dev/Services/FireBase/RegistryAuth.dart';

generateRandom() {
  int min = 2928;
  int max = 100000;
  print(DateTime.now());
  return min + Random().nextInt((max + 1) - min);
}

// add team to DB
SetTeam({
  required String name,
  required String Desc,
}) async {
  String userID = await checkusers();
  print(userID);
  var firestore = FirebaseFirestore.instance;
  await firestore.collection("Teams").doc().set({
    "TeamName": name,
    "TeamID": "#${generateRandom()}",
    "Description": "",
    "CreatorID": userID,
    "CreationDate": DateTime.now(),
    "Members": [userID],
    "InvitationCode": ""
  });
}

getUserTeams({required String UID}) async {
  var firestore = FirebaseFirestore.instance;
  var x = await firestore.collection("Users").doc(UID).get();
  print(x.data()!["Teams"]);
  //x.data()!["Teams"];
}

// // add team to user's team list DB
// addTeamToUserAcc({
//   required String UID,
// }) async {
  

//   var firestore = FirebaseFirestore.instance;

//   await firestore.collection("Users").doc(UID).set({
//     "Teams": ,
//   });
  
// }
