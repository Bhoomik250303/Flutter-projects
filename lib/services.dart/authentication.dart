import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  String phoneNumber;
  AuthService({required this.phoneNumber});
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<dynamic> signInWithPhone() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: '+91 ${phoneNumber}',
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (Exception e) {
          if (e.toString() == 'invalid-phone-number') {
            print('The provided phone number is invalid');
          } else {
            print(e.toString());
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          String otp = 'xxxx';
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: otp);
          await _auth.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }
}
