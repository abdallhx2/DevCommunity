import 'package:community_dev/Services/FireBase/Statistics.dart';
import 'package:community_dev/Services/FireBase/challenge.dart';
import 'package:community_dev/Services/NewsApi/NewsAPI.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var NumOfPost;
  var News;
  var Challenges;

  @override
  void onInit() async {
    NumOfPost = await getNumOfPosts();
    Challenges = await generateDailyChallenge();
    News = await getNews();
    update();
    // TODO: implement onInit
    super.onInit();
  }
}
