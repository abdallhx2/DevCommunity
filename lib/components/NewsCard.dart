import 'package:community_dev/components/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:community_dev/constants/style.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.title, required this.Link});
  final String title;
  String Link;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var _url = Uri.parse(Link);
        _launchUrl();
      },
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.15,
        decoration: BoxDecoration(
            color: colors.fields, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                title.toString(),
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: colors.Text,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(Link))) {
      throw 'Could not launch $Link';
    }
  }
}
