import 'package:community_dev/components/TeamNumberCard.dart';
import 'package:community_dev/views/Teams/TeamsScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class cardTeam extends StatelessWidget {
  const cardTeam(
      {super.key,
      required this.press,
      this.descriptiontext,
      this.idTeam,
      this.nameTeam,
      required this.fileed});
  final Function press;
  final String? nameTeam;
  final String? descriptiontext;
  final String? idTeam;
  final Color? fileed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: fileed,
            shadowColor: Colors.transparent),
        onPressed: press as void Function()?,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nameTeam!,
                            style: GoogleFonts.merriweather(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: colors.Text,
                            ),
                          ),
                          Text(
                            descriptiontext!,
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: colors.Text,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(idTeam!,
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: colors.icons,
                                fontWeight: FontWeight.normal,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TeamNumberCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
