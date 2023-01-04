import 'package:community_dev/Services/FireBase/Teams.dart';
import 'package:community_dev/components/OkButton.dart';
import 'package:community_dev/components/customTextField.dart';
import 'package:community_dev/components/nameTeam.dart';

import 'package:community_dev/components/primaryButton.dart';

import 'package:community_dev/components/descriptionCard.dart';
import 'package:community_dev/components/nameTeamCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:community_dev/constants/style.dart';

import 'package:group_button/group_button.dart';

class newTeam extends StatefulWidget {
  newTeam({super.key});

  @override
  State<newTeam> createState() => _newTeamState();
}

class _newTeamState extends State<newTeam> {
  //List colors = [Color.fromARGB(255, 65, 65, 65), Colors.transparent];

  @override
  Widget build(BuildContext context) {
    String teamName = "", teamDescription = "";
    List<String> list = <String>['Swift', 'Java', 'C', 'C++'];
    String dropdownValue = list.first;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colors.Text,
            size: 25,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Create New Team",
            style: GoogleFonts.merriweather(
                color: colors.Text, fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customTextField(
                  name: "Team name:*",
                  isPass: false,
                  hint: "Enter the team's name",
                  onChanged: (value) {
                    teamName = value;
                  },
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                customTextField(
                  name: "Description:*",
                  isPass: false,
                  hint: "Enter a simple description ",
                  onChanged: (value) {
                    teamDescription = value;
                  },
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                customTextField(
                  name: "Number of Members:",
                  isPass: false,
                  hint: "Enter the number of members ",
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        "Programming Language:",
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
                    SizedBox(
                      width: Get.width * 0.87,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: colors.feedBack,
                        borderRadius: BorderRadius.circular(10),
                        value: dropdownValue,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: colors.Text,
                        ),
                        elevation: 0,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: colors.Text,
                          fontWeight: FontWeight.w400,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                primaryButton(
                  width: Get.width * 0.3,
                  title: 'Create',
                  onPressed: () async {
                    if (teamName == "" && teamDescription == "")
                      return showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          content: Text("Enter the required information",
                              style: GoogleFonts.lato(
                                  color: colors.icons,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600)),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OkButton(),
                              ],
                            )
                          ],
                        ),
                      );

                    if (teamName.trim() != "" && teamDescription.trim() != "") {
                      await SetTeam(name: teamName, Desc: teamDescription);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Your Team is Created Successfully 🎉'),
                          backgroundColor: colors.primary));

                      Get.back();
                    }
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
