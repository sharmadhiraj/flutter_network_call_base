import 'dart:async';

import 'package:flutter/material.dart';

abstract class BaseStatefulWidget<T> extends StatefulWidget {
  String getTitle();

  Widget body(T data);

  Future<T> future();

  @override
  State<StatefulWidget> createState() => BaseState<T>(getTitle());
}

class BaseState<T> extends State<BaseStatefulWidget> {
  final String title;
  Future<T> future;

  BaseState(this.title);

  @override
  void initState() {
    super.initState();
    future = widget.future();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? widget.body(snapshot.data)
                  : InkWell(
                      child: Center(
                          child: Text("Failed to connect ! Tap to retry !!")),
                      onTap: () => setState(() {
                        future = widget.future();
                      }),
                    )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
