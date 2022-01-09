import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:servicezz_clone/screens/checkout_screen.dart';
import 'package:servicezz_clone/shared/colors.dart';
import 'package:servicezz_clone/models/userData.dart';
import 'package:servicezz_clone/services.dart/authentication.dart';
import 'package:servicezz_clone/shared/grid.dart';
import 'package:servicezz_clone/testingList.dart';
import 'package:servicezz_clone/wrapper.dart';

// Error at Desktop, Laptop, Online.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: navColor, systemNavigationBarColor: navColor));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return StreamProvider<UserData?>.value(
      initialData: null,
      value: AuthService().userStream,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
