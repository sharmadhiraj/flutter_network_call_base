import 'dart:async';

import 'package:flutter/material.dart';

abstract class BaseStatefulWidget<T> extends StatefulWidget {
  String getTitle();

  Widget body(AsyncSnapshot snapshot);

  Future future();

  @override
  State<StatefulWidget> createState() => BaseState(getTitle());
}

class BaseState extends State<BaseStatefulWidget> {
  final String title;

  BaseState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        future: widget.future(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
                  ? widget.body(snapshot)
                  : InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Text("Failed to connect ! Tap to retry !!"),
                      ),
                      onTap: () => setState(() {}),
                    )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
