import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_call_base/base.dart';
import 'package:flutter_network_call_base/network.dart';
import 'package:flutter_network_call_base/user.dart';
import 'package:flutter_network_call_base/user_detail.dart';

class UserListScreen extends BaseStatefulWidget<List<User>> {
  @override
  Widget body(List<User> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          User user = data[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailScreen(user.id, user.name),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Image.network(user.avatar),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(user.name),
                subtitle: Text(user.email),
              ),
            ),
          );
        });
  }

  @override
  Future<List<User>> future() {
    return getUserList();
  }

  @override
  String getTitle() {
    return "Users";
  }
}
