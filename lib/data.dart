import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class User {
  final String fullName;
  final String profilePicture;

  User(this.fullName, this.profilePicture);
}

Future<User> getUser() async {
  final response = await http.get("https://randomuser.me/api/");
  var jsonData = json.decode(response.body);
  jsonData = jsonData["results"][0];
  String fullName = capitalize(jsonData["name"]["first"]) +
      " " +
      capitalize(jsonData["name"]["last"]);
  String profilePicture = jsonData["picture"]["large"];
  return User(fullName, profilePicture);
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
