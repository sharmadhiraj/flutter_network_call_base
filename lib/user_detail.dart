import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_call_base/base.dart';
import 'package:flutter_network_call_base/network.dart';
import 'package:flutter_network_call_base/user.dart';

class UserDetailScreen extends BaseStatefulWidget<User> {
  final int id;
  final String name;

  UserDetailScreen(this.id, this.name);

  @override
  Widget body(User data) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Image.network(data.avatar, height: 160, width: 160),
          Container(height: 24),
          Card(child: ListTile(title: Text("Name"), subtitle: Text(data.name))),
          Card(
              child:
              ListTile(title: Text("Email"), subtitle: Text(data.email))),
        ],
      ),
    );
  }

  @override
  Future<User> future() {
    return getUserDetail(id);
  }

  @override
  String getTitle() {
    return name;
  }
}
