import 'package:cloud_firestore/cloud_firestore.dart';

getSpecificUser(
    {bool? name, bool? username, bool? email, required String UID}) async {
  var firestore = FirebaseFirestore.instance;

  var x = await firestore.collection("Users").doc(UID).get();
  if (name != null && name) {
    return x["Name"];
  } else if (username != null && username) {
    return x["UserName"];
  } else if (email != null && email) {
    return x["Email"];
  }
}

getUsers() async {
  var firestore = FirebaseFirestore.instance;
  var x = await firestore.collection("Users").get();
  List usersid = [];
  List usersname = [];

  for (var element in x.docs) {
    usersid.add(element.id); //list contains id of docs
  }
  //get the UserName of all user
  for (int i = 0; i < usersid.length; i++) {
    var x = await firestore.collection("Users").doc(usersid[i]).get();
    usersname.add(x["UserName"]);
    print(x["UserName"]);
  }
}
