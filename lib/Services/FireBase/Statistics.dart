// add the user to database after sign up
import 'package:cloud_firestore/cloud_firestore.dart';

setNumOfPosts({
  required int number,
}) async {
  var firestore = FirebaseFirestore.instance;
  await firestore.collection("Stats").doc("Stats").set({
    "NumberOfPosts": number,
  });
}

getNumOfPosts() async {
  var firestore = FirebaseFirestore.instance;
  var temp = await firestore.collection("Stats").doc("Stats").get();
  var result = temp.data();
  print(result);
}
