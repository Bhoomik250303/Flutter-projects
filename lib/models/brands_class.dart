import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:servicezz_clone/models/services_class.dart';
import 'package:servicezz_clone/shared/colors.dart';

class ListOfBrands extends StatefulWidget {
  List<String> brandsList;
  List<String> serviceList;
  String appliance;
  ListOfBrands(
      {required this.appliance,
      required this.brandsList,
      required this.serviceList});
  List<String> _isChecked = [];
  ButtonStyle _buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(buttonColorBrands),
      elevation: MaterialStateProperty.all(0.0));

  @override
  _ListOfBrandsState createState() => _ListOfBrandsState();
}

class _ListOfBrandsState extends State<ListOfBrands> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: card_background,
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: card_background,
        ),
        backgroundColor: card_background,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Brands",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            constraints: BoxConstraints(
                minHeight: heightScreen - 150, maxHeight: heightScreen - 50),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0))),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Select brand for your Desktop",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  RadioButtonGroup(
                    labels: widget.brandsList,
                    labelStyle: TextStyle(fontSize: 18.0),
                    activeColor: orangeColor,
                    onSelected: (String value) {
                      setState(() {
                        widget._buttonStyle = ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            elevation: MaterialStateProperty.all(0.0));
                      });
                      if (widget._isChecked.isEmpty) {
                        widget._isChecked.add(value);
                      } else {
                        widget._isChecked.removeAt(0);
                        widget._isChecked.add(value);
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Note:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0)),
                      const Text(
                        "You can choose one brand at a time.",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: BottomAppBar(
          color: card_background,
          child: TextButton(
            style: widget._buttonStyle.copyWith(
                elevation: MaterialStateProperty.all(0.0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)))),
            child: Text(
              "Proceed",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListOfServices(
                      brands: widget._isChecked[0],
                      appliance: widget.appliance,
                      serviceList: widget.serviceList,
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:grouped_buttons/grouped_buttons.dart';
// import 'package:servicezz_clone/shared/colors.dart';

// class ListOfBrands {
//   List<String> brandsList;
//   double height;
//   double width;
//   ListOfBrands(
//       {required this.brandsList, required this.height, required this.width});
//   List<String> _isChecked = [];
//   ButtonStyle _buttonStyle = ButtonStyle(
//       backgroundColor: MaterialStateProperty.all(buttonColorBrands),
//       elevation: MaterialStateProperty.all(0.0));

//   Widget widgetBrands() {
//     if (_isChecked.length == 1) {
//       _buttonStyle = ButtonStyle(
//           backgroundColor: MaterialStateProperty.all(Colors.black),
//           elevation: MaterialStateProperty.all(0.0));
//     }
    
//     ;
//   }
// }
