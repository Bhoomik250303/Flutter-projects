import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicezz_clone/colors.dart';
import 'package:servicezz_clone/screens/drawer_screen.dart';
import 'package:servicezz_clone/screens/drawer1.dart';
import 'package:servicezz_clone/screens/home_screen.dart';
import 'package:servicezz_clone/screens/login_signin.dart';
import 'package:servicezz_clone/screens/orders.dart';
import 'package:servicezz_clone/screens/profile.dart';
import 'package:servicezz_clone/shared/body.dart';
import 'package:servicezz_clone/shared/costumer_testimonial.dart';
import 'package:servicezz_clone/shared/fragments.dart';
import 'package:servicezz_clone/shared/image_horizontal_scroll.dart';
import 'package:servicezz_clone/shared/what_servizz_do.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: navColor, systemNavigationBarColor: navColor));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    // FlutterStatusbarcolor.setStatusBarColor(Colors.black);
    return MaterialApp(
      home: Login(),
      routes: {
        '/homepage': (context) => Tabs(),
        'drawer0': (context) => Desktop(),
      },
    );
  }
}
