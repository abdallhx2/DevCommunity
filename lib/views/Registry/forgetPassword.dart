import 'package:community_dev/Services/FireBase/RegistryAuth.dart';
import 'package:community_dev/components/customTextField.dart';
import 'package:community_dev/components/primaryButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:community_dev/constants/style.dart';

class forgetPassword extends StatelessWidget {
  forgetPassword({super.key});
  TextEditingController emailcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colors.Text,
            size: 25,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          'Reset Password',
          style: GoogleFonts.merriweather(
              color: colors.Text, fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: Get.height / 9,
          ),
          customTextField(
            controller: emailcontrol,
            name: "Email",
            isPass: false,
            prefixIcon: Icon(
              Icons.alternate_email_rounded,
              size: 18,
              color: colors.icons,
            ),
            keyboardType: TextInputType.emailAddress,
            hint: "Enter your email to reset your password",
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          primaryButton(
            width: Get.width * 0.5,
            title: 'Send Request',
            onPressed: () async {
              await ResetPassMethod(emailAddress: emailcontrol.text);
              showDialog<void>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  title: Text('An Email Was Sent To You',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.asap(
                        color: Color(0xff606060),
                        fontSize: 17,
                      )),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //position
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            child: Text(
                              'OK',
                              style: GoogleFonts.asap(
                                fontSize: 21,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                fixedSize: Size(
                                    MediaQuery.of(context).size.width / 2.7,
                                    MediaQuery.of(context).size.width / 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                                //padding: EdgeInsets.all(2),
                                elevation: 0,
                                primary: colors.primary,
                                shadowColor: Colors.transparent),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
