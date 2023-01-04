import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_dev/Helper/utils.dart';
import 'package:community_dev/Services/FireBase/ProfileAuth.dart';
import 'package:community_dev/Services/FireBase/RegistryAuth.dart';
import 'package:community_dev/Services/FireBase/Timeline.dart';
import 'package:community_dev/components/customTextField.dart';
import 'package:community_dev/components/primaryButton.dart';
import 'package:community_dev/components/OkButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:community_dev/Helper/imagePicker.dart';

class editProfile extends StatelessWidget {
  editProfile({
    super.key,
  });
  File? image;

  @override
  Widget build(BuildContext context) {
    String bio = "";
    String city = "";
    Stream<QuerySnapshot<Object?>>? userStream = FirebaseFirestore.instance
        .collection('Users')
        .where("userID", isEqualTo: GetStorage().read("UID"))
        .snapshots();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: colors.Text,
              size: 25,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text("Edit profile",
              style: GoogleFonts.merriweather(
                  color: colors.Text,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: userStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center();
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      InkWell(
                        onTap: () async {
                          image = await imagePicker.imgFromGallery();
                          String? postImageURL;
                          if (image != null) {
                            postImageURL = (await uploadProfileImage(
                                userID: GetStorage().read("UID"),
                                postImageFile: image))!;
                          }
                          updateImage(
                            imageURL: postImageURL ?? '',
                          );
                        },
                        child: doc['imageURL'] != ''
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    NetworkImage(doc['imageURL'], scale: 100))

                            // Container(
                            //     width: Get.width * 0.2,
                            //     height: Get.height * 0.2,
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(100)),
                            //     child: Utils.cacheNetworkImageWithEvent(
                            //         context, doc['imageURL'], 200, 200))
                            : CircleAvatar(
                                maxRadius: 60,
                                backgroundColor: colors.feedBack,
                                child: Image.asset(
                                  'assets/user2.png',
                                ),
                              ),
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      customTextField(
                        name: "Bio",
                        prefixIcon: Icon(
                          CupertinoIcons.person_fill,
                          size: 18,
                          color: colors.icons,
                        ),
                        isPass: false,
                        hint: doc["Bio"],
                        onChanged: (value) {
                          bio = value;
                        },
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      customTextField(
                        name: "City",
                        isPass: false,
                        prefixIcon: Icon(
                          Icons.alternate_email_rounded,
                          size: 18,
                          color: colors.icons,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          city = value;
                        },
                        hint: doc["City"],
                      ),
                      SizedBox(
                        height: Get.height * 0.07,
                      ),
                      primaryButton(
                        width: Get.width * 0.3,
                        title: 'Save',
                        onPressed: () {
                          if (city.trim() != "") {
                            updateCity(city: city);

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Your Information Updated Successfully 🎉'),
                                backgroundColor: colors.primary));
                          }
                          if (bio.trim() != "") {
                            updateBio(Bio: bio);

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    'Your Information Updated Successfully 🎉'),
                                backgroundColor: colors.primary));
                          }
                          if (city.trim() == "" && bio.trim() == "")
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                content: Text("Enter the updated information",
                                    style: GoogleFonts.lato(
                                        color: colors.icons,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600)),
                                actions: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      OkButton(),
                                    ],
                                  )
                                ],
                              ),
                            );
                          Get.back();
                        },
                      ),
                    ],
                  );
                },
              );
            }));
  }
}
