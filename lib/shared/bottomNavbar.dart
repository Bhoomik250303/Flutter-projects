import 'package:flutter/material.dart';
import 'package:servicezz_clone/screens/home_screen.dart';

import 'colors.dart';

final bottomNavbar = BottomAppBar(
  elevation: 0.0,
  shape: CircularNotchedRectangle(),
  color: navColor,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.home,
              size: 32,
              color: Colors.white,
            ),
            label: Text(
              "Home",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )),
        FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.assignment_sharp,
              size: 32,
              color: Colors.white,
            ),
            label: Text(
              "Orders",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )),
        FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.assignment_ind_rounded,
              size: 32,
              color: Colors.white,
            ),
            label: Text(
              "Profile",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            )),
      ],
    ),
  ),
);
