## Reusable stateful widget for network call with progress & retry 

Base StatefulWidget Setup to overcome repetitive boilerplate code in every screen with network call.


#### Getting started
- Copy <a href="https://github.com/sharmadhiraj/flutter_network_call_base/blob/master/lib/base.dart" target="_blank">base.dart</a> to your project.
- Extend your StatefulWidget by BaseStatefulWidget<T>. T here is data type that is returned by Future.
- Implement methods *getTitle(),body<T>(T data), future<T>()*.
  

API used : https://reqres.in/
