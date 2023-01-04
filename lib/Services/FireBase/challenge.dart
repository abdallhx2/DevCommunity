import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

getChallenges() async {
  var firestore = FirebaseFirestore.instance;
  var x = await firestore.collection("Challenges").doc("challenge").get();
  return x.data();
}

addChallenges() async {
  Map<String, dynamic> Challenges = {
    "0": "Code in a new language",
    "1": "Build a binary search tree",
    "2":
        "Print Hello World in several different ways in a programming language",
    "3":
        "Write a function that will find the 50th number in the Fibonacci Sequence",
    "4": "Write a function that tests if a number, n, is a prime number",
    "5": "Write a function that tests if a number, n, is a even number",
    "6":
        "Write a function that will take a given string and reverse the order of the words",
    "7": "Write a function to check that a binary search tree is balanced",
    "8":
        "Write a function to reverse the order of words that have punctuation and keep the punctuation in place",
    "9":
        "Write a function that will find the nth number in the Fibonacci Sequence",
    "10":
        "Write a function that will print out all prime numbers in a given string",
    "11": "Create a length converter function",
    "12": "Calculate the sum of numbers within an array",
    "13": "Print all even numbers from 0 to 10",
    "14": "Create a function that reverses an array",
    "15": "Sort an array from lowest to highest",
    "16": "Sort an array from highest to lowest",
    "17": "Remove the spaces found in a string",
    "18":
        "Write a function that returns a Boolean if a number is divisible by 10",
    "19": "Write a function that returns the number of vowels in a string",
  };
  var firestore = FirebaseFirestore.instance;
  await firestore.collection("Challenges").doc("challenge").set(Challenges);
}

generateDailyChallenge() async {
  int num;
  int previous = -1;
  Map<String, dynamic>? Challenges = await getChallenges();
  List dailyChallenge = [];

  num = Random().nextInt(19);
  previous = num;

  for (int i = 0; i < 2; i++) {
    if (num == previous && i != 0) num = num + 1 % Challenges!.length;
    dailyChallenge.add(Challenges!["$num"]);
  }
  GetStorage().write("dailyChallenge", dailyChallenge);
  return dailyChallenge;
}
