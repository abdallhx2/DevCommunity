import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class Contact extends StatelessWidget {
  const Contact(
      {super.key,
      this.name,
      this.number,
      this.imagePath,
      required this.isAdded});
  final String? name;
  final String? number;
  final bool isAdded;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: colors.fields,
      onTap: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // tileColor: Color(0xff00000),
      leading: Container(
        width: Get.width * 0.1,
        height: Get.height * 0.16,
        child: CircleAvatar(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath.toString(),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: Text(
        name.toString(),
        style: GoogleFonts.openSans(
          fontSize: 18,
          color: colors.Text,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        number.toString(),
        style: GoogleFonts.openSans(
          fontSize: 16,
          color: colors.icons,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: isAdded
          ? null
          : IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: colors.Text,
              )),
    );
  }
}
