import 'package:flutter/material.dart';
import 'package:servicezz_clone/shared/colors.dart';
import 'package:servicezz_clone/shared/wallet_balance.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "Bhoomik";
  int phoneNum = 9967643280;
  String addEmail = "Add email address";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: navColor,
        appBar: AppBar(
          
          backgroundColor: navColor,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    DefaultTabController.of(context)?.animateTo(0);
                  },
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  "My Profile",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1.0,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0)),
                    color: Colors.white),
                margin: EdgeInsets.only(top: 32.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${name}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Text(
                        '${phoneNum}',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        '${addEmail}',
                        style: TextStyle(
                            color: orangeColor,
                            fontSize: 16,
                            letterSpacing: 0.9,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          color: orangeColor,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 88.0),
                            child: Text(
                              "Manage address",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.9,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: 75, width: width, child: WalletBalance()),
                      Divider(
                        color: Colors.grey,
                        thickness: 0.8,
                        indent: 16,
                        endIndent: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 0.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Recent Transactions",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width / 2) - 20,
              top: 10.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: orangeColor,
                ),
                height: 55,
                width: 50,
                child: Center(
                  child: Text(
                    '${name[0]}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
