import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:community_dev/constants/style.dart';
import 'package:google_fonts/google_fonts.dart';

class profileOptionCard extends StatelessWidget {
  const profileOptionCard(
      {super.key,
      required this.title,
      this.onTap,
      required this.icon,
      this.TileColor,
      this.textColor});
  final String title;
  final Function()? onTap;
  final IconData icon;
  final Color? TileColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: ListTile(
        tileColor: TileColor == null ? colors.fields : TileColor,
        enableFeedback: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: Icon(
          icon,
          color: textColor == null ? colors.primary : textColor,
        ),
        title: Text(
          title.toString(),
          style: GoogleFonts.openSans(
            fontSize: 18,
            color: textColor == null ? colors.primary : textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
