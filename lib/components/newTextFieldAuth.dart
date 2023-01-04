import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';

class customTextFieldAuth extends StatelessWidget {
  customTextFieldAuth(
      {super.key,
      required this.name,
      this.prefixIcon,
      required this.isPass,
      this.keyboardType,
      this.onChanged,
      this.controller,
      this.hint});
  final String name;
  final String? hint;
  final Icon? prefixIcon;
  final Function(String)? onChanged;
  bool isPass = false;
  TextInputType? keyboardType = TextInputType.text;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              "${name.toString()}",
              style: GoogleFonts.merriweather(
                fontSize: 18,
                color: colors.Text,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: prefixIcon != null ? 60 : 50,
            width: Get.width * 0.85,
            child: TextFormField(
                onChanged: onChanged,
                textAlignVertical: prefixIcon != null
                    ? TextAlignVertical.center
                    : TextAlignVertical.bottom,
                controller: controller,
                keyboardType: keyboardType,
                obscureText: isPass,
                cursorColor: colors.primary,
                //initialValue: hint,
                style: GoogleFonts.lato(
                  color: colors.Text,
                ),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: GoogleFonts.lato(
                    color: colors.icons,
                  ),
                  prefixIcon: prefixIcon,
                  isCollapsed: prefixIcon != null ? true : false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: colors.fields.withOpacity(0.2),
                )),
          ),
        ],
      ),
    );
  }
}
