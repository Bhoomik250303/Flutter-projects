import 'package:flutter/material.dart';
import 'package:servicezz_clone/shared/colors.dart';

class Guarantee extends StatelessWidget {
  const Guarantee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          Text(
            "Guarantee Hygiene Service",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.white),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Your safety is our priority. Our engineer will follow all hygienic standards",
            style: TextStyle(
                color: Colors.white, fontSize: 12.0, letterSpacing: 1.0),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: circular_avatar_color_last_container,
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Mandatory",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Mask",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: circular_avatar_color_last_container,
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Contactless",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Service",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: circular_avatar_color_last_container,
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Regular",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Sanitization",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
