import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_dev/components/TeamNumberCard.dart';
import 'package:community_dev/views/Teams/TeamsScreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';
import 'package:flutter/material.dart';

class TeamCreationInfo extends StatelessWidget {
  const TeamCreationInfo({
    super.key,
    required this.Date,
  });
  final Timestamp Date;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row(
            //   children: [
            //     Text(
            //       'Created by',
            //       style: GoogleFonts.lato(
            //         fontSize: 16,
            //         color: colors.Text,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     SizedBox(
            //       width: Get.width * 0.02,
            //     ),
            //     Text(
            //       username.toString(),
            //       style: GoogleFonts.lato(
            //         fontSize: 14,
            //         color: colors.Text,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Text(
                  'Created',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: colors.Text,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.02,
                ),
                Text(
                  Date.toDate().toString().substring(0, 10),
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: colors.Text,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TeamNumberCard(),
          ],
        )
      ],
    );
  }
}
