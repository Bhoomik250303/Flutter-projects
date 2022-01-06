import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:servicezz_clone/screens/checkout_screen.dart';
import 'package:servicezz_clone/shared/colors.dart';

class ListOfServices extends StatefulWidget {
  String? brands;
  String appliance;
  List<String> serviceList;

  ListOfServices(
      {required this.serviceList, required this.appliance, this.brands});
  List<String> _checkedOptions = [];

  ButtonStyle _buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(buttonColorBrands),
      elevation: MaterialStateProperty.all(0.0));

  @override
  _ListOfServicesState createState() => _ListOfServicesState();
}

class _ListOfServicesState extends State<ListOfServices> {
  final List<bool> _isChecked = [false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: card_background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: card_background,
        ),
        backgroundColor: card_background,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              Text("${widget.appliance} Service",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            constraints: BoxConstraints(
                maxHeight: (widget.serviceList.length + 1) * 128),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    "Select brand for your CCTV",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: heightScreen - 300,
                  child: ListView.builder(
                    itemCount: widget.serviceList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: card_background,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: ListTile(
                            leading: Text(
                              widget.serviceList[index],
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5),
                            ),
                            trailing: Checkbox(
                              activeColor: orangeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              value: _isChecked[index],
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked[index] = value!;
                                });
                                if (_isChecked[index]) {
                                  widget._checkedOptions
                                      .add(widget.serviceList[index]);
                                } else {
                                  if (widget._checkedOptions
                                      .contains(widget.serviceList[index])) {
                                    widget._checkedOptions
                                        .remove(widget.serviceList[index]);
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: BottomAppBar(
          color: card_background,
          child: TextButton(
            style: widget._checkedOptions.isNotEmpty
                ? widget._buttonStyle.copyWith(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(0.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0))))
                : widget._buttonStyle.copyWith(
                    elevation: MaterialStateProperty.all(0.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)))),
            child: const Text(
              "Proceed",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              if (widget._checkedOptions.isEmpty) {
                print("No Service Selected");
              } else {
                print(widget._checkedOptions);
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                                services: widget._checkedOptions,
                                brands: [],
                                height: heightScreen,
                                width: widthScreen,
                                appliance: widget.appliance)))
                    .then((value) => setState(() {
                          for (int i = 0; i < _isChecked.length; i++) {
                            _isChecked[i] = false;
                          }
                        }));
              }
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
