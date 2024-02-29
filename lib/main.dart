import 'package:flutter/material.dart';
import 'package:flutter_network_call_base/screens/user_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListScreen(),
      theme: ThemeData(useMaterial3: false),
    );
  }
}
