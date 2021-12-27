import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:servicezz_clone/colors.dart';
import 'package:servicezz_clone/screens/drawer_screen.dart';
import 'package:servicezz_clone/shared/grid.dart';
import 'package:servicezz_clone/shared/last_container.dart';
import 'package:servicezz_clone/shared/what_servizz_do.dart';

import 'costumer_testimonial.dart';
import 'image_horizontal_scroll.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = "Bhoomik";
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: <Widget>[
            SafeArea(
              child: Container(
                height: 72.0,
                // color: navColor,
                decoration: BoxDecoration(
                    color: navColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 32.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                            overflow: Overflow.visible,
                            children: <Widget>[
                              Positioned(
                                top: 30,
                                child: Text(
                                  "Need Help?",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.grey[300],
                                      letterSpacing: 1.0),
                                ),
                              ),
                              Text(
                                "Hello ${name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 1.0),
                              ),
                            ]),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(128.0, 0.0, 0.0, 0.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: DrawerPage()),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6.0),
              child: Center(child: ImageScrollView()),
              height: 200,
              width: 500,
            ),
            Container(
              child: Grid(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 30.0, 140.0, 0.0),
              child: SizedBox(
                child: Text(
                  "How Servizz Works",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                height: 500,
                width: 500,
                child: About()),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Color.fromRGBO(275, 275, 275, 0.1),
              ),
              height: 275,
              width: widthScreen,
              child: CostumerTestimonials(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      stops: [0.6, 0.9, 1],
                      end: Alignment.bottomCenter,
                      colors: [gradient_start, gradient_mid, gradient_last])),
              child: Guarantee(),
            ),
          ])),
    );
  }
}
