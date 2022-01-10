import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:servicezz_clone/models/how_servizz_work_model.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  List<HowServizzWork> _listOfAbouts = [
    HowServizzWork(
        title: "Choose the services you need.",
        subtitle: "We Provide installation & servicing."),
    HowServizzWork(
        title: "Select your time slot",
        subtitle: "We service from 9 AM - 8 PM."),
    HowServizzWork(
        title: "Hassle free service.",
        subtitle:
            "Our professional will get in touch with you one hour before the service."),
    HowServizzWork(
        title: "Software", subtitle: "We promote only liscensed software."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.orange,
                ),
                backgroundColor: Color.fromRGBO(0, 0, 0, 0),
              ),
              title: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 8.0),
                child: Text(
                  _listOfAbouts[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0),
                child: Text(
                  _listOfAbouts[index].subtitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
            );
          }),
    );
  }
}
