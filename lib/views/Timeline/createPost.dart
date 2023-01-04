import 'dart:io';
import 'dart:math';

import 'package:community_dev/Helper/imagePicker.dart';
import 'package:community_dev/Helper/utils.dart';
import 'package:community_dev/Services/FireBase/Timeline.dart';
import 'package:community_dev/components/primaryButton.dart';
import 'package:community_dev/constants/style.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class createPost extends StatefulWidget {
  const createPost({
    Key? key,
  }) : super(key: key);

  @override
  WritePostPage createState() => WritePostPage();
}

class WritePostPage extends State<createPost> {
  final myController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  FocusNode writingTextFocus = FocusNode();
  File? image;
  bool _isLoading = false;
  String text = '';

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.white,
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          displayArrows: false,
          focusNode: _nodeText1,
        ),
        KeyboardActionsItem(
          displayArrows: false,
          focusNode: writingTextFocus,
          toolbarButtons: [
            (node) {
              return GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Icon(Icons.add_photo_alternate_rounded,
                          color: Color(0xffD1D6DB), size: 30),
                    ],
                  ),
                ),
              );
            },
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width / 10,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close_rounded, color: colors.Text, size: 30),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 10),
            child: primaryButton(
              width: Get.width * 0.2,
              title: 'Post',
              onPressed: () {
                setState(() {
                  _isLoading = true;
                  postToFB(image: image, content: myController.text);
                  _isLoading = false;
                });

                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      body: Stack(children: [
        KeyboardActions(
          config: _buildConfig(context),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.width / 2.3,
                child: TextFormField(
                    focusNode: writingTextFocus,
                    autofocus: true,
                    controller: myController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorHeight: 18,
                    decoration: InputDecoration(
                      hintText: '  What are you thinking about?',
                      hintStyle: GoogleFonts.lato(
                        color: colors.icons,
                        fontSize: 16,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle:
                          TextStyle(color: Color(0xffD1D6DB), fontSize: 15),
                      border: InputBorder.none,
                    ),
                    onChanged: (val) {
                      setState(() {
                        text = val;
                      });
                    }),
              ),
              image != null
                  ? Container(
                      child: Image.file(
                        image!,
                        fit: BoxFit.fill,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        Utils.loadingCircle(_isLoading),
      ]),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: const Icon(
                        Icons.photo_library,
                      ),
                      title: const Text('Photo Library'),
                      onTap: () async {
                        image = await imagePicker.imgFromGallery();

                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () async {
                      image = await imagePicker.imgFromCamera();

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void postToFB({File? image, String? content}) async {
    setState(() {
      _isLoading = true;
    });
    String postID = 'TLPost' + Random().nextInt(500).toString();
    String? postImageURL;
    if (image != null) {
      postImageURL =
          (await uploadPostImages(postID: postID, postImageFile: image))!;
    }
    print("postToFB");
    sendPostInFirebase(
      postID,
      content!,
      postImageURL ?? 'NONE',
      GetStorage().read("username"),
    );
    setState(() {
      _isLoading = false;
    });
  }
}
