// ignore_for_file: file_names, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print
import 'dart:io';
import 'package:community_dev/Services/FireBase/Timeline.dart';
import 'package:community_dev/components/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../Helper/utils.dart';
import 'package:community_dev/Helper/imagePicker.dart';

class EditPost extends StatefulWidget {
  final String Name;
  final DocumentSnapshot data;
  const EditPost({Key? key, required this.data, required this.Name})
      : super(key: key);

  @override
  EditPostPage createState() => EditPostPage();
}

class EditPostPage extends State<EditPost> {
  final myController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  FocusNode writingTextFocus = FocusNode();
  File? image;
  bool _isLoading = false;
  late String text;

  @override
  void initState() {
    text = widget.data['postContent'];
  }

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

  void _updateFB() async {
    setState(() {
      _isLoading = true;
    });

    String? postImageURL;
    if (image != null) {
      postImageURL = (await uploadPostImages(
          postID: widget.data['postID'], postImageFile: image))!;
    }

    updatePostInFirebase(
        postID: widget.data['postID'],
        postContent: text,
        postImageURL: postImageURL ?? "NONE",
        name: "name");
    setState(() {
      _isLoading = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width / 10,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              //padding: EdgeInsets.all(2),
              elevation: 0,
              primary: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: const Icon(Icons.close_rounded,
                color: Color(0xffD1D6DB), size: 30),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 10),
            child: primaryButton(
                width: Get.width * 0.2,
                title: 'Save',
                onPressed: () => _updateFB()),
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
                    //  controller: myController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorHeight: 18,
                    initialValue: widget.data['postContent'],
                    decoration: const InputDecoration(
                      // hintText: '  ' + widget.data['postContent'],
                      // hintStyle: const TextStyle(
                      //   color: Color(0xffD1D6DB),
                      //   fontFamily: 'Helvetica',
                      //   fontSize: 16,
                      // ),
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
                  ? Image.file(
                      image!,
                      fit: BoxFit.fill,
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
}
