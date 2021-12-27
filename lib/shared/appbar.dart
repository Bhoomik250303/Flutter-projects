import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicezz_clone/colors.dart';

String name = 'Bhoomik';
final appbarProperties = AppBar(
  systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: navColor),
  elevation: 0.0,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  backgroundColor: Color.fromRGBO(30, 34, 46, 1),
  title: Container(
    margin: EdgeInsets.all(10.0),
    child: Stack(overflow: Overflow.visible, children: <Widget>[
      Positioned(
        top: 25,
        child: Text(
          "Need Help?",
          style: TextStyle(
              fontSize: 12.0, color: Colors.grey[300], letterSpacing: 1.0),
        ),
      ),
      Text(
        "Hello ${name}",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, letterSpacing: 1.0),
      ),
    ]),
  ),
  actions: <Widget>[
    Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 20.0, 0.0),
      child: Icon(
        Icons.menu,
        size: 24.0,
      ),
    ),
  ],
);
