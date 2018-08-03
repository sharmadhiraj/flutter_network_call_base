import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_network_call_base/base.dart';
import 'package:flutter_network_call_base/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UserProfilePage());
  }
}

class UserProfilePage extends BaseStatefulWidget {
  @override
  Widget body(AsyncSnapshot snapshot) {
    User user = snapshot.data;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(user.profilePicture, height: 200.0),
          Text(user.fullName, style: TextStyle(fontSize: 20.0)),
        ],
      ),
    );
  }

  @override
  Future future() => getUser();

  @override
  String getTitle() => "User Profile";
}
