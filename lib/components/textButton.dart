import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class textButton extends StatelessWidget {
  textButton(
      {super.key, required this.name, required this.underline, this.onPressed});
  final String name;
  bool underline;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        enableFeedback: false,
        overlayColor: MaterialStateProperty.all(colors.feedBack),
      ),
      child: Text(
        name.toString(),
        style: GoogleFonts.openSans(
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
          fontSize: 16,
          color: colors.hyperlinks,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
