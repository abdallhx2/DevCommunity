//Get full profile
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_dev/Services/FireBase/RegistryAuth.dart';
import 'package:community_dev/Services/GetStorage/userInfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

getProfileMethod() async {
  String id = await checkusers();
  var firestore = FirebaseFirestore.instance;
  var x = await firestore.collection("Users").doc(id).get();
  return x;
}

getOtherUserProfile({required String id}) async {
  var firestore = FirebaseFirestore.instance;
  var x = await firestore.collection("Users").doc(id).get();
  return x;
}
// //updating the profile in database
// UpdateProfileMethod(
//     {String? email,
//     String? name,
//     String? userName,
//     String? Bio,
//     String? password,
//     String? city}) async {
//   String userID = await checkusers();

//   var firestore = FirebaseFirestore.instance;
//   if (email != null && email.trim() == "") {
//     await firestore.collection("Users").doc(userID).update({
//       "Email": email,
//     });
//     await updatingEmail(email: email);
//   }
//   if (name != null && name.trim() == "") {
//     await firestore.collection("Users").doc(userID).update({
//       "Name": name,
//     });
//   }
//   if (userName != null && userName.trim() == "") {
//     await firestore.collection("Users").doc(userID).update({
//       "UserName": userName,
//     });
//   }
//   if (Bio != null && Bio.trim() == "") {
//     await firestore.collection("Users").doc(userID).update({
//       "Bio": Bio,
//     });
//   }
//   if (password != null && password.trim() == "") {
//     _changePassword(password);
//   }
//   if (city != null && city.trim() == "") {
//     await firestore.collection("Users").doc(userID).update({
//       "City": city,
//     });
//   }

//   await GetProfile();
// }

//updating the email in database
updateEmail({
  required String email,
}) async {
  String userID = await checkusers();

  var firestore = FirebaseFirestore.instance;

  await firestore.collection("Users").doc(userID).update({
    "Email": email,
  });
  await updatingEmail(email: email);

  await GetProfile();
}

//updating the user name in database
updateName({
  required String name,
}) async {
  String userID = await checkusers();

  var firestore = FirebaseFirestore.instance;

  await firestore.collection("Users").doc(userID).update({
    "Name": name,
  });

  await GetProfile();
}

//updating the user's username in database
updateUsername({
  required String userName,
}) async {
  String userID = await checkusers();

  var firestore = FirebaseFirestore.instance;

  await firestore.collection("Users").doc(userID).update({
    "UserName": userName,
  });

  await GetProfile();
}

//updating the user's bio in database
updateBio({
  required String Bio,
}) async {
  String userID = await checkusers();

  var firestore = FirebaseFirestore.instance;

  await firestore.collection("Users").doc(userID).update({
    "Bio": Bio,
  });

  await GetProfile();
}

//updating the user's password in auth
updatePassword({
  required String password,
}) async {
  String userID = await checkusers();

  var firestore = FirebaseFirestore.instance;

  _changePassword(password);

  await GetProfile();
}

//updating the user's city in db
updateCity({
  required String city,
}) async {
  String userID = await checkusers();

  var firestore = FirebaseFirestore.instance;

  await firestore.collection("Users").doc(userID).update({
    "City": city,
  });

  await GetProfile();
}

//to Update emain in the list of user for auth
Future updatingEmail({required String email}) async {
  try {
    await FirebaseAuth.instance.currentUser!.updateEmail(email);
  } catch (e) {
    print(e);
  }
}

// update profile image
updateImage({
  required String imageURL,
}) async {
  String userID = await checkusers();
  print(userID);
  var firestore = FirebaseFirestore.instance;
  await firestore
      .collection("Users")
      .doc(userID)
      .update({"imageURL": imageURL});
}

void _changePassword(String newPassword) async {
  final user = await FirebaseAuth.instance.currentUser;
  final cred = EmailAuthProvider.credential(
      email: GetStorage().read("email"),
      password: GetStorage().read("password"));

  user?.reauthenticateWithCredential(cred).then((value) {
    user.updatePassword(newPassword).then((_) {
      //Success, do something
    }).catchError((error) {
      //Error, show something
    });
  }).catchError((err) {});
}
