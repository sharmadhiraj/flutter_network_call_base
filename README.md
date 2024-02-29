## Reusable Stateful Widget for Network Calls with Progress & Retry

This project provides a base StatefulWidget setup to streamline repetitive boilerplate code
typically encountered in every screen with network calls.

#### Getting Started

- Copy
  the [base.dart](https://github.com/sharmadhiraj/flutter_network_call_base/blob/master/lib/base.dart)
  file to your project.
- Extend your StatefulWidget by `BaseStatefulWidget<T>`. Here, `T` represents the data type returned
  by the Future.
- Implement the following methods: `getTitle()`, `body<T>(T data)`, `future<T>()`.

API used: [https://reqres.in/](https://reqres.in/)
