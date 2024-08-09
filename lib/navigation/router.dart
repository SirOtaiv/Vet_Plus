import 'package:flutter/material.dart';

class Navigation {
  void push(BuildContext context, Widget page) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  void back(BuildContext context) async {
    Navigator.pop(context);
  }
}
