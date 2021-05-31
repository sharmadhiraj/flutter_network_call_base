import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_call_base/base.dart';
import 'package:flutter_network_call_base/network.dart';
import 'package:flutter_network_call_base/user.dart';

class UserDetailScreen extends BaseStatefulWidget {
  final int id;
  final String name;

  UserDetailScreen(this.id, this.name);

  @override
  Widget body(dynamic data) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Image.network(
            data.avatar,
            height: 160,
            width: 160,
          ),
          Container(height: 24),
          Card(
            child: ListTile(
              title: Text("Name"),
              subtitle: Text(data.name),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Email"),
              subtitle: Text(data.email),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<User> future() => getUserDetail(id);

  @override
  String getTitle() => name;
}
