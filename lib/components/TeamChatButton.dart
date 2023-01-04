import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: colors.fields.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 4,
                  color: colors.primary,
                )),
            height: 50,
            width: Get.width * 0.5,
            child: Center(
              child: Text(
                'Start Voice Chat',
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
