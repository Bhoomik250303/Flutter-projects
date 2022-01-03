import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicezz_clone/colors.dart';
import 'package:servicezz_clone/screens/otp_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  late String phoneNumber;
  bool button_submit = false;
  Text buttonText = Text(
    'Enter phone number',
    style: TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
  );
  dynamic buttonColor = orangeColorBackground;
  TextStyle phoneNumberStyleOnFocus =
      TextStyle(color: orangeColor, fontSize: 16);
  TextStyle phoneNumberStyle = TextStyle(color: Colors.grey[700], fontSize: 16);
  FocusNode myFocusNode = FocusNode();

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
            "Login",
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
              Container(
                width: widthContainer,
                margin: EdgeInsets.only(top: 48.0, left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "Login / SignUp",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 25),
                      ),
                    ),
                    Text(
                      'Enter your phone number to proceed',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 32.0, horizontal: 24.0),
                child: TextFormField(
                  focusNode: myFocusNode,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  onChanged: (val) {
                    if (val.length == 10) {
                      setState(() {
                        phoneNumber = val;
                        button_submit = true;
                        buttonColor = orangeColor;
                        buttonText = const Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        );
                      });
                    } else {
                      setState(() {
                        button_submit = false;
                        buttonColor = orangeColorBackground;
                        buttonText = Text(
                          'Enter phone number',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        );
                      });
                    }
                  },
                  decoration: InputDecoration(
                    counterText: "",
                    labelText: 'Phone Number',
                    labelStyle: myFocusNode.hasFocus
                        ? phoneNumberStyleOnFocus
                        : phoneNumberStyle,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                          style: BorderStyle.solid),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: orangeColor,
                          style: BorderStyle.solid),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          color: orangeColor,
                          style: BorderStyle.solid),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (button_submit == true) {
                    print(phoneNumber);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(
                            phoneNumber: phoneNumber,
                          ),
                        ));
                  }
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: buttonColor,
                  ),
                  width: MediaQuery.of(context).size.width - 48,
                  duration: const Duration(microseconds: 200000),
                  child: Center(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: buttonText),
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
