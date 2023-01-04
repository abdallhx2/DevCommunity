import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_dev/Services/FireBase/RegistryAuth.dart';
import 'package:community_dev/views/Timeline/createPost.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<String?> uploadPostImages(
    {required String postID, required File? postImageFile}) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  String fileName = 'images/$postID/Test';
  Reference reference = storage.ref().child(fileName);
  UploadTask uploadTask = reference.putFile(postImageFile!);
  TaskSnapshot storageTaskSnapshot = await uploadTask;
  String postImageURL = await storageTaskSnapshot.ref.getDownloadURL();
  return postImageURL;
}

Future<String?> uploadProfileImage(
    {required String userID, required File? postImageFile}) async {
  FirebaseStorage storage = FirebaseStorage.instance;
  String fileName = 'images/$userID/Test';
  Reference reference = storage.ref().child(fileName);
  UploadTask uploadTask = reference.putFile(postImageFile!);
  TaskSnapshot storageTaskSnapshot = await uploadTask;
  String postImageURL = await storageTaskSnapshot.ref.getDownloadURL();
  return postImageURL;
}

Future<void> sendPostInFirebase(
    String postID, String postContent, String postImageURL, String name) async {
  print("sendPostInFirebase");
  var UID = await checkusers();
  print(UID);
  FirebaseFirestore.instance.collection('Posts').doc(postID).set({
    'postID': postID,
    'postTimeStamp': DateTime.now().millisecondsSinceEpoch,
    'postContent': postContent,
    'postImage': postImageURL,
    'posterName': name,
    'posterID': UID
  });
}

Future<void> deletePostFromFirebase(String postID) async {
  FirebaseFirestore.instance.collection('Posts').doc(postID).delete();
}

Future<void> updatePostInFirebase(
    {required String postID,
    required String postContent,
    required String postImageURL,
    required String name}) async {
  print("sendPostInFirebase");
  var UID = await checkusers();
  print(UID);
  FirebaseFirestore.instance
      .collection('Posts')
      .doc(postID)
      .update({'postContent': postContent, 'postImage': postImageURL});
}
