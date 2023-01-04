import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

getNews() async {
  // List<Map> LatestNews = [];
  // var url = Uri.https('newsdata.io', 'api/1/news', {
  //   'apikey': 'pub_15069291d994b17913a01eb86c5d50dafec1c',
  //   "country": "us",
  //   "category": "technology"
  // });
  // var response = await http.get(url);
  // var result = json.decode(response.body);

  // //print(response.statusCode);
  // if (response.statusCode == 200) {
  //   for (int i = 0; i < 5; i++)
  //     LatestNews.add({
  //       "title": "${result["results"][i]["title"]}",
  //       "Link": "${result["results"][i]["link"]}"
  //     });

  //   GetStorage().write("LatestNews", LatestNews);
  //   // print(LatestNews);
  //   return LatestNews;
  // }
  // return LatestNews;
}
