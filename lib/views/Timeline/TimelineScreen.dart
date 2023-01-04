import 'package:community_dev/Services/FireBase/RegistryAuth.dart';
import 'package:community_dev/components/cutsomFloatingActionButton.dart';
import 'package:community_dev/components/postItem.dart';

import 'package:community_dev/constants/style.dart';
import 'package:community_dev/views/profile/Mypost.dart';
import 'package:community_dev/views/Timeline/createPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TimelineScreen extends StatefulWidget {
  const TimelineScreen({
    Key? key,
    required this.isMyPost,
  }) : super(key: key);
  final bool isMyPost;
  @override
  TimelineScreenPage createState() => TimelineScreenPage();
}

class TimelineScreenPage extends State<TimelineScreen> {
  final auth = FirebaseAuth.instance;

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Object?>>? timelineStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('postTimeStamp', descending: true)
        .snapshots();
    Stream<QuerySnapshot<Object?>>? MyPostStream = FirebaseFirestore.instance
        .collection('Posts')
        .where("posterID", isEqualTo: GetStorage().read("UID"))
        .snapshots();
    var user = FirebaseAuth.instance.currentUser?.uid;
    

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: widget.isMyPost
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: colors.Text,
                  size: 25,
                ),
                onPressed: () {
                  Get.back();
                },
              )
            : Center(),
        centerTitle: true,
        title: Text(widget.isMyPost ? "My Posts" : 'Timeline',
            style: GoogleFonts.merriweather(
                color: colors.Text, fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: widget.isMyPost
          ? Center()
          : FloatingActionButton(
              onPressed: () {
                Get.to(() => createPost());
              },
              backgroundColor: colors.primary,
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
      body: Column(
        children: [
          Container(
            child: Text('data'),
          ),
          Expanded(
            child: Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: widget.isMyPost ? MyPostStream : timelineStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return LinearProgressIndicator(
                      color: colors.primary,
                    );
                  return Stack(
                    children: <Widget>[
                      (snapshot.data!.docs.isNotEmpty && snapshot.hasData)
                          ? Container(
                              child: ListView(
                                shrinkWrap: true,
                                children: snapshot.data!.docs.map(
                                  (DocumentSnapshot data) {
                                    return PostItem(
                                      data: data,
                                      isFromThread: true,
                                      parentContext: context,
                                    );
                                  },
                                ).toList(),
                              ),
                            )
                          : Container(
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: Text(
                                      'There are no posts added.',
                                      style: TextStyle(
                                          fontSize: 16, color: colors.icons),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              )),
                            ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
