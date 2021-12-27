import 'package:flutter/material.dart';
import 'package:servicezz_clone/models/drawer_list_class.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  List<DrawerListClass> _listOfDrawerList = [
    DrawerListClass(url: "1", text: "Refer & Earn", pageRoute: "drawer0"),
    DrawerListClass(url: "2", text: "Manage address", pageRoute: "drawer1"),
    DrawerListClass(url: "3", text: "Notifications", pageRoute: "drawer2"),
    DrawerListClass(url: "4", text: "Help & Support", pageRoute: "drawer3"),
    DrawerListClass(url: "5", text: "FAQs", pageRoute: "drawer4"),
    DrawerListClass(url: "6", text: "Privacy Policy", pageRoute: "drawer5"),
    DrawerListClass(url: "7", text: "Logout", pageRoute: "drawer6"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'drawer${index}');
            },
            child: ListTile(
              leading: Text(
                _listOfDrawerList[index].url,
                style: TextStyle(color: Colors.white),
              ),
              title: Text(
                _listOfDrawerList[index].text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
