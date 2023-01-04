import 'package:community_dev/views/Teams/newTeamScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class logoo extends StatelessWidget {
  const logoo(
      {super.key, required this.text, required this.press, required this.icon});
  final String text;
  final Function()? press;

  final String icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 30,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: colors.Text,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
