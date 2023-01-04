import 'dart:io';

import 'package:community_dev/views/Timeline/createPost.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imagePicker {
  static Future<File?> imgFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return null;
    final imageTemp = File(image.path);
    return imageTemp;
  }

  static Future<File?> imgFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    final imageTemp = File(image.path);
    return imageTemp;
  }

}
