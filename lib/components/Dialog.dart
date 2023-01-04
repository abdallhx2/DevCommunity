import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

import 'primaryButton.dart';

class Dialog extends StatelessWidget {
  const Dialog({super.key, this.title, this.content, required this.Ok});
  final String? title;
  final Widget? content;
  final bool Ok;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title.toString(),
        //textAlign: TextAlign.left,
        style: GoogleFonts.openSans(
          fontSize: 20,
          color: colors.Text,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: content,
      actions: <Widget>[
        if (Ok)
          primaryButton(
            title: 'Ok',
            onPressed: () {},
          ),
      ],
    );
  }
}
