import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    double widthContainer = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: login_orange,
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: login_orange,
        ),
        backgroundColor: login_orange,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Verify",
            style: TextStyle(
                color: orangeColor, fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), color: Colors.white),
          width: widthContainer,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  'asset/image/servizz_logo.jpeg',
                  height: 128,
                  width: 128,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
