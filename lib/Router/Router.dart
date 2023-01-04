import 'package:community_dev/views/HouseScreen.dart';

import 'package:community_dev/views/DashboardScreen.dart';

import 'package:community_dev/views/Registry/login.dart';
import 'package:community_dev/views/Registry/register.dart';
import 'package:community_dev/views/Teams/SpecificTeamScreen.dart';
import 'package:community_dev/views/Teams/TeamsScreen.dart';
import 'package:community_dev/views/Timeline/TimelineScreen.dart';
import 'package:community_dev/views/Registry/forgetPassword.dart';
import 'package:community_dev/views/profile/Profile.dart';

import 'package:community_dev/views/Timeline/createPost.dart';
import 'package:community_dev/views/splashScreen.dart';

import 'package:get/get.dart';

List<GetPage<dynamic>>? routerApp = [
  GetPage(
    name: NameRoute.signIn,
    page: () => LogIn(),
  ),
  GetPage(
    name: NameRoute.signUp,
    page: () => Register(),
  ),
  GetPage(
    name: NameRoute.timeline,
    page: () => TimelineScreen(
      isMyPost: false,
    ),
  ),
  GetPage(
    name: NameRoute.newPost,
    page: () => createPost(),
  ),
  GetPage(
    name: NameRoute.dashborad,
    page: () => DashboardSecond(),
  ),
  GetPage(
    name: NameRoute.teams,
    page: () => TeamsScreen(),
  ),
  GetPage(
    name: NameRoute.mainScreen,
    page: () => HouseScreen(),
  ),
  GetPage(
    name: NameRoute.profile,
    page: () => Profile(),
  ),
  GetPage(
    name: NameRoute.forgetPass,
    page: () => forgetPassword(),
  ),
  GetPage(
    name: NameRoute.splash,
    page: () => SplashScreen(),
  ),
];

abstract class NameRoute {
  static String signIn = "/signIn";
  static String signUp = "/signUp";
  static String splash = "/splash";
  static String timeline = "/timeline";
  static String newPost = "/newPost";
  static String dashborad = "/dashborad";
  static String teams = "/teams";
  static String team = "/team";
  static String mainScreen = "/mainScreen";
  static String profile = "/profile";
  static String forgetPass = "/forgetPass";
}
