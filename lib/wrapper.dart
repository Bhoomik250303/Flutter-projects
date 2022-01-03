import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicezz_clone/models/userData.dart';
import 'package:servicezz_clone/screens/login_signin.dart';
import 'package:servicezz_clone/shared/fragments.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    UserData? user = Provider.of<UserData?>(context);
    print("Printing user data from Stream :- ${user?.uid}");
    if (user?.uid == null) {
      return Login();
    } else {
      return Tabs();
    }
  }
}
