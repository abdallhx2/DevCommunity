import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';
import 'package:flutter/material.dart';

class nameTeam extends StatelessWidget {
  const nameTeam({super.key, required this.Dec, required this.TeamID});
  final String Dec;
  final String TeamID;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Dec.toString(),
          style: GoogleFonts.merriweather(
            fontSize: 16,
            color: colors.Text,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          TeamID.toString(),
          style: GoogleFonts.lato(
            fontSize: 13,
            color: colors.icons,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
