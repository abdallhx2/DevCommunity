import 'package:card_swiper/card_swiper.dart';
import 'package:community_dev/components/ChallengeTime.dart';
import 'package:flutter/material.dart';
import 'package:community_dev/constants/style.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Challenge extends StatelessWidget {
  const Challenge({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Daily Challenge",
          style: GoogleFonts.merriweather(
            fontSize: 22,
            color: colors.Text,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: Get.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xffB4AEE8).withOpacity(0.3),
          ),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Container(
            padding: EdgeInsets.all(15),
            // width: MediaQuery.of(context).size.width ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        title.toString(),
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: colors.Text,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChallengeTime(),
                      Container(
                        height: 40,
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: const EdgeInsets.all(0),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            width: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(colors: [
                                  colors.Text,
                                  colors.primary,
                                ])),
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "Complete",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.merriweather(
                                fontSize: 14,
                                color: colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
