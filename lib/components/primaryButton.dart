import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class primaryButton extends StatelessWidget {
  const primaryButton(
      {super.key, required this.title, this.onPressed, this.width});
  final String title;
  final double? width;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width:
              width != null ? width : MediaQuery.of(context).size.width / 1.2,
          height: 45.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(2),
                elevation: 0,
                backgroundColor: colors.primary.withOpacity(0.9),
                shadowColor: Colors.transparent),
            onPressed: onPressed,
            child: Text(
              title.toString(),
              style: GoogleFonts.merriweather(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
