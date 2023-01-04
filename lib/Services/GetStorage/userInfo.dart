import 'package:community_dev/Services/FireBase/ProfileAuth.dart';
import 'package:community_dev/Services/FireBase/RegistryAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get_storage/get_storage.dart';

GetStorage box = GetStorage();

GetProfile() async {
  var user = FirebaseAuth.instance.currentUser?.uid.toString();
  var data = await getProfileMethod();
  box.write("email", data["Email"]);
  box.write("name", data["Name"]);
  box.write("username", data["UserName"]);
  box.write("bio", data["Bio"]);
  box.write("UID", user);
  box.write("city", data["City"]);
}
