import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class TeamNumberCard extends StatelessWidget {
  const TeamNumberCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          CupertinoIcons.person_3_fill,
          color: colors.Text,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '4',
          style: GoogleFonts.lato(
              color: colors.Text, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        Text(
          '/',
          style: GoogleFonts.lato(
              color: colors.Text, fontSize: 14, fontWeight: FontWeight.w700),
        ),
        Text(
          '10',
          style: GoogleFonts.lato(
              color: colors.Text, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
