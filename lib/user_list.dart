import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_call_base/base.dart';
import 'package:flutter_network_call_base/network.dart';
import 'package:flutter_network_call_base/user.dart';
import 'package:flutter_network_call_base/user_detail.dart';

class UserListScreen extends BaseStatefulWidget {
  @override
  Widget body(dynamic data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        User user = data[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailScreen(
                  user.id,
                  user.name,
                ),
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
      },
    );
  }

  @override
  Future<List<User>> future() => getUserList();

  @override
  String getTitle() => "Users";
}
