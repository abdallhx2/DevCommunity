import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class OkButton extends StatelessWidget {
  const OkButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Ok',
        style: GoogleFonts.merriweather(
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
          primary: colors.primary,
          shadowColor: Colors.transparent),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}