//This file contains
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:community_dev/Services/GetStorage/userInfo.dart';

import 'package:community_dev/views/HouseScreen.dart';

import 'package:community_dev/views/Registry/login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Sign in method
SignInMethod({required String emailAddress, required String password}) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);

    GetProfile();

    Get.to(HouseScreen());
    return "Success";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      return 'Wrong password provided for that user.';
    }
  } catch (e) {
    return e.toString();
  }
}

//Sign up method
SignUpMethod(
    {required String emailAddress,
    required String password,
    required String userName,
    required String name}) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    await SetProfile(email: emailAddress, name: name, userName: userName);
    GetProfile();
    Get.to(HouseScreen());
    return "Success";
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      return 'The password provided is too weak.';
    } else if (e.code == 'email-already-in-use') {
      return 'The account already exists for that email.';
    }
  } catch (e) {
    return e.toString();
  }
}

// add the user to database after sign up
SetProfile({
  required String email,
  required String name,
  required String userName,
}) async {
  String userID = await checkusers();
  print(userID);
  var firestore = FirebaseFirestore.instance;
  await firestore.collection("Users").doc(userID).set({
    "Name": name,
    "Email": email,
    "UserName": userName,
    "Bio": "Enter your bio",
    "City": "Enter your city", "imageURL": "",
    "Teams": [],
    "CreationDate": DateTime.now(),
    "userID": userID,
    // "ProgrammingLanguages": [],
  });
}

//Check the user status and return his UID
checkusers() async {
  print("checkusers");
  try {
    final auth = await FirebaseAuth.instance;
    final users = await auth.currentUser?.uid;
    print(users);
    return users;
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case "operation-not-allowed":
        print("Anonymous auth hasn't been enabled for this project.");
        break;
      default:
        print("Unknown error.");
    }
  }
}

//Sign out method
SignOutMethod() async {
  await FirebaseAuth.instance.signOut();
  Get.offAll(() => LogIn());
}

//Reset password method
ResetPassMethod({required String emailAddress}) async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
}
