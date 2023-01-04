import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_dev/Services/FireBase/Timeline.dart';
import 'package:community_dev/constants/style.dart';
import 'package:community_dev/views/Timeline/editPost.dart';
import 'package:community_dev/views/profile/EditProfile.dart';
import 'package:community_dev/views/profile/MemberProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helper/utils.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:community_dev/constants/style.dart';

class PostItem extends StatefulWidget {
  final BuildContext parentContext;
  final DocumentSnapshot data;
  final bool isFromThread;

  const PostItem({
    Key? key,
    required this.data,
    required this.isFromThread,
    required this.parentContext,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PostItem();
}

class _PostItem extends State<PostItem> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Object?>>? userStream = FirebaseFirestore.instance
        .collection('Users')
        .where("userID", isEqualTo: widget.data['posterID'])
        .snapshots();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Card(
        color: colors.fields,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            StreamBuilder<QuerySnapshot>(
                stream: userStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return LinearProgressIndicator(
                      color: colors.primary,
                    );

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: ((context, index) {
                        DocumentSnapshot doc = snapshot.data!.docs[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() => MemberProfile(
                                memberID: doc["userID"],
                                username: doc["UserName"]));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 20,
                                backgroundColor: colors.feedBack,
                                child: Image.asset(
                                  'assets/user2.png',
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(doc['UserName'],
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        color: colors.Text,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                    Utils.readTimestamp(
                                        widget.data['postTimeStamp']),
                                    style: GoogleFonts.lato(
                                        color: colors.icons,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        );
                      }));
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 4, 10),
              child: Text(
                (widget.data['postContent'] as String).length > 200
                    ? '${widget.data['postContent'].substring(0, 132)} ...'
                    : widget.data['postContent'],
                style: GoogleFonts.lato(
                  fontSize: 16,
                ),
                //maxLines: 10,
              ),
            ),
            widget.data['postImage'] != 'NONE'
                ? Container(
                    child: Utils.cacheNetworkImageWithEvent(
                        context, widget.data['postImage'], 0, 0))
                : Container(),
            GetStorage().read("UID") == widget.data['posterID']
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(
                            iconSize: 20,
                            color: colors.icons,
                            icon: FaIcon(
                              FontAwesomeIcons.edit,
                              size: 20,
                              color: colors.icons,
                            ),

                           
                            onPressed: () {
                              //editProfile( widget.data['postID'],);
                              Get.to(() => EditPost(
                                    data: widget.data,
                                    Name: "",
                                  ));
                            },
                          )),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: IconButton(
                              color: colors.error,
                              iconSize: 20,
                              icon: const Icon(
                                Icons.delete_rounded,
                              ),
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    content: Text(
                                        'Are you sure you want to delete your post?',
                                        style: GoogleFonts.lato(
                                            color: colors.icons,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600)),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ErrorButton(widget: widget),
                                          customTextButton(),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              })),
                    ],
                  )
                : Container(),
          ]),
        ),
      ),
    );
  }
}

class customTextButton extends StatelessWidget {
  const customTextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: (Size(MediaQuery.of(context).size.width / 4,
            MediaQuery.of(context).size.width / 10)),
        padding: const EdgeInsets.all(2),
        elevation: 0,
        primary: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      child: Text('Cancel',
          style: GoogleFonts.lato(
              color: colors.primary,
              fontSize: 18,
              fontWeight: FontWeight.w500)),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

class ErrorButton extends StatelessWidget {
  const ErrorButton({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final PostItem widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Delete',
        style: GoogleFonts.lato(
          fontSize: 21,
          color: colors.white,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
          //alignment: Alignment.bottomCenter,
          fixedSize: Size(Get.width * 0.3, Get.height * 0.01),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
          primary: colors.error,
          shadowColor: Colors.transparent),
      onPressed: () {
        deletePostFromFirebase(
          widget.data['postID'],
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Your Post was Deleted Successfully 🎉'),
            backgroundColor: colors.primary));
        Navigator.pop(context);
      },
    );
  }
}
