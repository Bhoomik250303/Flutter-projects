import 'package:firebase_auth/firebase_auth.dart';
import 'package:servicezz_clone/models/userData.dart';

class AuthService {
  String? phoneNumber;
  AuthService({this.phoneNumber});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserData? _firebaseAuthToUserModel(User? user) {
    return user != null ? UserData(uid: user.uid) : null;
  }

  Stream<UserData?> get userStream {
    return _auth.userChanges().map(_firebaseAuthToUserModel);
  }

  signOut() async {
    return _auth.signOut();
  }

  signIn(AuthCredential cred) {
    _auth.signInWithCredential(cred);
  }

  signInWithOtp(String verId, String sms) {
    PhoneAuthCredential authResult =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: sms);

    signIn(authResult);
  }
}
