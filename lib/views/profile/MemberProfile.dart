import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_dev/Helper/utils.dart';

import 'package:community_dev/Services/FireBase/RegistryAuth.dart';

import 'package:community_dev/components/ProfileCards.dart';
import 'package:community_dev/components/logo.dart';
import 'package:community_dev/components/primaryButton.dart';
import 'package:community_dev/components/profileOptionCard.dart';
import 'package:community_dev/views/profile/EditProfile.dart';

import 'package:community_dev/views/profile/Mypost.dart';
import 'package:community_dev/views/profile/Settings.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class MemberProfile extends StatelessWidget {
  const MemberProfile(
      {super.key, required this.memberID, required this.username});
  final String memberID;
  final String username;
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Object?>>? userStream = FirebaseFirestore.instance
        .collection('Users')
        .where("userID", isEqualTo: memberID)
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
        title: Text("${username}",
            style: GoogleFonts.merriweather(
                color: colors.Text, fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: userStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center();
            }

            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      doc['imageURL'] != ''
                          ? CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  NetworkImage(doc['imageURL'], scale: 100))
                          // Image.network(doc['imageURL']))

                          // Utils.cacheNetworkImageWithEvent(
                          //     context, doc['imageURL'], 0, 0))
                          : CircleAvatar(
                              maxRadius: 60,
                              backgroundColor: colors.feedBack,
                              child: Image.asset(
                                'assets/user2.png',
                              ),
                            ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text(
                        doc['Name'],
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          color: colors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          logoo(
                            icon: 'assets/kotlin.png',
                            press: () {},
                            text: "KOTLIN",
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          logoo(
                            icon: 'assets/swift.png',
                            press: () {},
                            text: "SWIFT",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      profileCard(
                        title: "Email",
                        value: doc["Email"],
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      profileCard(
                        title: "Bio",
                        value: doc["Bio"],
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      profileCard(
                        title: "City",
                        value: doc["City"],
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      primaryButton(
                        width: Get.width * 0.5,
                        title: "Contact me",
                        onPressed: () {},
                      )
                    ],
                  );
                }));
          }),
      resizeToAvoidBottomInset: false,
    );
  }
}
