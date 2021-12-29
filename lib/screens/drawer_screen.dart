import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:servicezz_clone/colors.dart';
import 'package:servicezz_clone/models/drawer_list.dart';
import 'package:servicezz_clone/screens/home_screen.dart';
import 'package:servicezz_clone/shared/body.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: navColor,
        elevation: 0.0,
        actions: <Widget>[
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(16.0)),
            child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(
                      context,
                      PageTransition(
                          child: Home(), type: PageTransitionType.topToBottom));
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 32.0,
                ),
                label: Text(" ")),
          ),
        ],
      ),
      body: Container(
          margin: EdgeInsets.symmetric(vertical: 64.0, horizontal: 88.0),
          child: DrawerList()),
    );
  }
}
