import 'package:community_dev/Controller/RegistryController.dart';
import 'package:community_dev/Services/FireBase/RegistryAuth.dart';
import 'package:community_dev/components/OkButton.dart';
import 'package:community_dev/components/background.dart';
import 'package:community_dev/components/newTextFieldAuth.dart';

import 'package:community_dev/views/Registry/forgetPassword.dart';
import 'package:community_dev/views/Registry/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community_dev/constants/style.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Container(
          color: colors.backgroundcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                child: Image.asset('assets/logo2.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.merriweather(
                        fontSize: 22,
                        color: colors.Text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  customTextFieldAuth(
                    controller: emailcontrol,
                    name: "Email",
                    isPass: false,
                    hint: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: size.height * 0.03),
                  customTextFieldAuth(
                    controller: passcontrol,
                    name: "Password",
                    isPass: true,
                    hint: "Enter your username",
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {},
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        Get.to(forgetPassword());
                      },
                      child: Text(
                        "Forgot your password?",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: colors.hyperlinks,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        GetStorage().write("password", passcontrol.text);

                        String result = await SignInMethod(
                            emailAddress: emailcontrol.text,
                            password: passcontrol.text);

                        if (result != "Success")
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              content: Text(result,
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
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: LinearGradient(
                                colors: [colors.primary, colors.Text])),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.merriweather(
                            fontSize: 18,
                            color: colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        Get.to(Register());
                      },
                      child: Text(
                        "Don't Have an Account? Sign Up",
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          color: colors.hyperlinks,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
