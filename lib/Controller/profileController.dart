import 'package:community_dev/Services/FireBase/ProfileAuth.dart';
import 'package:community_dev/Services/FireBase/RegistryAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController biocontrol = TextEditingController();
  TextEditingController userNamecontrol = TextEditingController();
  TextEditingController nameControl = TextEditingController();
  String email = "", bio = "", username = "", name = "", UID = "";

  //proframing languages
  //TextEditingController plcontrol = TextEditingController();
  GetUID() async {
    UID = await checkusers();
  }

  GetProfile() async {
    var data = await getProfileMethod();
    emailcontrol.text = data["Email"];
    nameControl.text = data["Name"];
    userNamecontrol.text = data["UserName"];
    biocontrol.text = data["Bio"];
    email = data["Email"];
    name = data["Name"];
    username = data["UserName"];
    bio = data["Bio"];
    update();
  }

  // Updateprofile() async {
  //   await UpdateProfileMethod(
  //       email: emailcontrol.text,
  //       name: nameControl.text,
  //       userName: userNamecontrol.text,
  //       Bio: biocontrol.text);
  // }

  void initialize() {
    // TODO: implement onInit
    super.onInit();
    GetProfile();
    GetUID();
  }

  // @override
  // void onReady() {
  //   // TODO: implement onReady
  //   super.onReady();
  //   GetProfile();
  //   GetUID();
  // }
}
