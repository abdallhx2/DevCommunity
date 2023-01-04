import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_dev/Controller/dashboardController.dart';
import 'package:community_dev/components/Slider.dart';

import 'package:community_dev/components/Challenge.dart';
import 'package:community_dev/components/newUserCard.dart';

import 'package:community_dev/components/WelcomeCard.dart';
import 'package:community_dev/views/profile/MemberProfile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class DashboardSecond extends StatelessWidget {
  const DashboardSecond({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Object?>>? newUsersStream = FirebaseFirestore.instance
        .collection('Users')
        .orderBy("CreationDate", descending: true)
        .limit(3)
        .snapshots();
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            WelocmeCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GetBuilder<DashboardController>(
                    init: DashboardController(),
                    builder: (controller) {
                      if (controller.Challenges != null)
                        return Challenge(
                            title: controller.Challenges[0].toString());
                      return Challenge(title: "Loading");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Latest News",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.merriweather(
                      fontSize: 22,
                      color: colors.Text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: Get.width * 0.02,
                  ),
                  GetBuilder<DashboardController>(builder: ((controller) {
                    return DotSlider();
                  })),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to DevCommunity",
                    style: GoogleFonts.merriweather(
                      fontSize: 22,
                      color: colors.Text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: newUsersStream,
                      builder: ((context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("No data"),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 32, right: 32, bottom: 32, top: 10),
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data?.docs.length,
                              itemBuilder: ((context, index) {
                                DocumentSnapshot doc =
                                    snapshot.data!.docs[index];
                                return newUserCard(
                                  userID: doc["UserName"],
                                  userName: doc["Name"],
                                  imageURL: doc["imageURL"],
                                  onTap: () {
                                    Get.to(() => MemberProfile(
                                          memberID: doc["userID"],
                                          username: doc["UserName"],
                                        ));
                                  },
                                );
                              })),
                        );
                      })),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
