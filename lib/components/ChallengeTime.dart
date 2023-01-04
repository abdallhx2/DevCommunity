import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class ChallengeTime extends StatelessWidget {
  const ChallengeTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          child: Image.asset('assets/time-left.png'),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Expected time: ",
                style: GoogleFonts.lato(
                    color: colors.Text,
                    fontSize: 13,
                    fontWeight: FontWeight.w900)),
            Text("20 Minute ",
                style: GoogleFonts.lato(
                  color: colors.Text,
                  fontSize: 12,
                )),
          ],
        ),
      ],
    );
  }
}
