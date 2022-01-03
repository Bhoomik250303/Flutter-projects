import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:servicezz_clone/screens/loading.dart';
import 'package:servicezz_clone/services.dart/authentication.dart';
import 'package:servicezz_clone/shared/fragments.dart';
import '../colors.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  OtpScreen({required this.phoneNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutfocusNode = FocusNode();
  BoxDecoration _pinPutDecoration = BoxDecoration(
      color: otp_backgroundColor, borderRadius: BorderRadius.circular(16.0));

  String? verificationCode, smsCode;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    double widthContainer = MediaQuery.of(context).size.width;
    double heightContainer = MediaQuery.of(context).size.height;
    signInWithPhone(widget.phoneNumber);

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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0), color: Colors.white),
            width: widthContainer,
            height: heightContainer,
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
                      onSubmit: (String pin) async {
                        setState(() {
                          this.smsCode = pin;
                        });
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoadingScreen()));
                        await AuthService()
                            .signInWithOtp(verificationCode!, smsCode!);
                        Navigator.pop(context,true);
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
                        Expanded(
                            child: TextButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.border_color_rounded,
                                  color: Colors.grey[700],
                                ),
                                label: Text("Change number",
                                    style: TextStyle(color: Colors.grey[700]))))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithPhone(String phoneNumber) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed notVerified =
        (FirebaseAuthException exception) {
      print(exception);
    };

    final PhoneCodeSent smsSent = (String vID, int? forceResendingToken) {
      this.verificationCode = vID;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String vID) {
      this.verificationCode = vID;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91" + phoneNumber,
      verificationCompleted: verified,
      verificationFailed: notVerified,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout,
    );
  }
}
