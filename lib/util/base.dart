import 'dart:async';

import 'package:flutter/material.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  String getTitle();

  Widget body(dynamic data);

  Future<dynamic> future();

  @override
  State<StatefulWidget> createState() => BaseState(getTitle());
}

class BaseState extends State<BaseStatefulWidget> {
  final String title;
  late Future<dynamic> future;

  BaseState(this.title);

  @override
  void initState() {
    super.initState();
    future = widget.future();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? widget.body(snapshot.data)
                  : InkWell(
                      child: Center(
                        child: Text("Failed to connect ! Tap to retry !!"),
                      ),
                      onTap: () => setState(() => future = widget.future()),
                    )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
