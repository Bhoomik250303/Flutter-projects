import 'package:flutter/material.dart';

class Desktop extends StatefulWidget {
  const Desktop({Key? key}) : super(key: key);

  @override
  _DesktopState createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Desktop"),
      ),
    );
  }
}
