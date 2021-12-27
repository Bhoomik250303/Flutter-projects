import 'package:flutter/material.dart';
import 'package:servicezz_clone/colors.dart';

class SubmitLoginButton extends StatefulWidget {
  bool state;
  SubmitLoginButton({required this.state});

  @override
  _SubmitLoginButtonState createState() => _SubmitLoginButtonState();
}

class _SubmitLoginButtonState extends State<SubmitLoginButton> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    if (widget.state == true) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: FlatButton(
          minWidth: widthScreen,
          height: 50,
          onPressed: () {},
          child: Text(
            "Continue",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          color: orangeColor,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: FlatButton(
          minWidth: widthScreen,
          height: 50,
          onPressed: () {},
          child: Text(
            "Enter phone number",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          color: orangeColorBackground,
        ),
      );
    }
  }
}
