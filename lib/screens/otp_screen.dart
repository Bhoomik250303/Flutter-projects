import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:servicezz_clone/services.dart/authentication.dart';

import '../colors.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutfocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        color: otp_backgroundColor, borderRadius: BorderRadius.circular(16.0));
  }

  @override
  Widget build(BuildContext context) {
    double widthContainer = MediaQuery.of(context).size.width;
    //data = ModalRoute.of(context).settings.arguments;
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
              Text('Enter the OTP we\'ve sent on'),
              SizedBox(
                height: 6.0,
              ),
              Text(
                widget.phoneNumber,
                style: TextStyle(
                    color: orangeColor,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
              ),
              SizedBox(
                height: 16.0,
              ),
              Center(
                child: Container(
                  width: widthContainer - 48,
                  child: PinPut(
                    onSubmit: (String pin) {
                      AuthService().signInWithPhone();
                    },
                    fieldsCount: 6,
                    focusNode: _pinPutfocusNode,
                    controller: _pinPutController,
                    submittedFieldDecoration: _pinPutDecoration,
                    selectedFieldDecoration: _pinPutDecoration,
                    followingFieldDecoration: _pinPutDecoration,
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: Row(
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.replay_sharp,
                          color: Colors.grey[700],
                        ),
                        label: Text(
                          "Resend OTP",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      // Expanded(flex: 1, child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(left: 96.0),
                        child: Expanded(
                            child: TextButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.border_color_rounded,
                                  color: Colors.grey[700],
                                ),
                                label: Text("Change number",
                                    style:
                                        TextStyle(color: Colors.grey[700])))),
                      )
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
