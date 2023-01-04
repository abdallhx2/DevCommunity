import 'package:flutter/material.dart';
import 'package:community_dev/constants/style.dart';
import 'package:google_fonts/google_fonts.dart';

class ChallengeButton extends StatelessWidget {
  const ChallengeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
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
              fontSize: 288,
              color: colors.Text,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
