import 'package:community_dev/Controller/RegistryController.dart';
import 'package:community_dev/Services/FireBase/RegistryAuth.dart';
import 'package:community_dev/components/ChallengeButton.dart';
import 'package:community_dev/components/OkButton.dart';
import 'package:community_dev/components/background.dart';
import 'package:community_dev/components/newTextFieldAuth.dart';
import 'package:community_dev/views/Registry/login.dart';
import 'package:community_dev/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  Register({super.key});
  // finding the controller which has been established in the main
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passcontrol = TextEditingController();
  TextEditingController userNamecontrol = TextEditingController();
  TextEditingController nameControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Container(
          color: colors.backgroundcolor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 60,
                    child: Image.asset('assets/logo2.png'),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create New Account",
                      style: GoogleFonts.merriweather(
                        fontSize: 18,
                        color: colors.Text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              customTextFieldAuth(
                name: "Name",
                isPass: false,
                hint: "Enter your name",
                keyboardType: TextInputType.text,
                controller: nameControl,
              ),
              SizedBox(height: size.height * 0.02),
              customTextFieldAuth(
                name: "Username",
                isPass: false,
                hint: "Enter your username",
                keyboardType: TextInputType.text,
                controller: userNamecontrol,
              ),
              SizedBox(height: size.height * 0.02),
              customTextFieldAuth(
                name: "Email",
                isPass: false,
                hint: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                controller: emailcontrol,
              ),
              SizedBox(height: size.height * 0.02),
              customTextFieldAuth(
                name: "Password",
                isPass: true,
                hint: "Enter your password",
                keyboardType: TextInputType.visiblePassword,
                controller: passcontrol,
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed: () async {
                    GetStorage().write("password", passcontrol.text);
                      String result = await SignUpMethod(
                      emailAddress: emailcontrol.text,
                      password: passcontrol.text,
                      name: nameControl.text,
                      userName: userNamecontrol.text,
                    );
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
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(
                            colors: [colors.primary, colors.Text])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "Sign Up",
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
                    Get.off(() => LogIn());
                  },
                  child: Text(
                    "Already Have an Account? Sign in",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: colors.hyperlinks),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
