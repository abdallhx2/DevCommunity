import 'package:community_dev/Router/Router.dart';
import 'package:community_dev/Services/FireBase/challenge.dart';
import 'package:community_dev/Services/NewsApi/NewsAPI.dart';
import 'package:community_dev/constants/style.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'Helper/firebase_options.dart';
import 'package:community_dev/constants/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //to put the controller for registry(Sign in , Sign Up ,forget password)
  String? user = FirebaseAuth.instance.currentUser?.uid; // get user uid

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: colors.white,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: colors.primary),
        ),
        debugShowCheckedModeBanner: false,
        getPages: routerApp,
        initialRoute: user != null
            ? NameRoute.mainScreen
            : NameRoute.splash // check if the user logged in
        );
    // theme: ThemeData(scaffoldBackgroundColor: colors.backgroundcolor),

    //   getPages: routerApp,
    //   initialRoute: user != null
    //       ? NameRoute.splash
    //       : NameRoute.mainScreen, // check if the user logged in
    // );
  }
}
