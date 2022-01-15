import 'package:flutter/material.dart';
import 'package:servicezz_clone/shared/colors.dart';
import 'package:servicezz_clone/screens/orders.dart';
import 'package:servicezz_clone/screens/profile.dart';
import 'package:servicezz_clone/shared/body.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: navColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            ),
            height: 88.0,
            child: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              tabs: [
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 0.0),
                      child: Icon(Icons.home),
                    ),
                    Positioned(
                      child: Text('Home'),
                      left: 32,
                      top: 4,
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 0.0),
                      child: Icon(Icons.assignment),
                    ),
                    Positioned(
                      child: Text('Orders'),
                      left: 32,
                      top: 4,
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 0.0),
                      child: Icon(Icons.assignment_ind),
                    ),
                    Positioned(
                      child: Text('Profile'),
                      left: 32,
                      top: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [Body(), Order(), Profile()],
          ),
        ),
      ),
    );
  }
}
