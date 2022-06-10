import 'package:flutter/material.dart';

class LoginPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return _LoginPageState();
      },
    );
  }
}

class _LoginPageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("hello"),
      ),
    );
  }
}
