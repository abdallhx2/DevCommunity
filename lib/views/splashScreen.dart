import 'dart:async';
import 'package:community_dev/Controller/RegistryController.dart';
import 'package:community_dev/components/background.dart';

import 'package:community_dev/views/Registry/forgetPassword.dart';
import 'package:community_dev/views/Registry/login.dart';
import 'package:community_dev/views/Registry/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community_dev/constants/style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 700), () {
      setState(() {
        Get.to(LogIn());
      });
    });

    new Timer(Duration(milliseconds: 14), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: colors.backgroundcolor),
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0,
          duration: Duration(milliseconds: 1500),
          child: Center(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Center(child: Image.asset('assets/logo.png')),
            ),
          ),
        ),
      ),
    );
  }
}
