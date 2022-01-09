import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:servicezz_clone/models/costumer_testimonial_model.dart';
import 'package:servicezz_clone/screens/checkout_screen.dart';
import 'package:servicezz_clone/shared/colors.dart';

class ListOfServices extends StatefulWidget {
  final String? brands;
  String appliance;
  final List<String> serviceList;

  ListOfServices(
      {required this.serviceList, required this.appliance, this.brands});
  List<String> _checkedOptions = [];

  final ButtonStyle _buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(buttonColorBrands),
      elevation: MaterialStateProperty.all(0.0));

  @override
  _ListOfServicesState createState() => _ListOfServicesState();
}

class _ListOfServicesState extends State<ListOfServices> {
  ScrollPhysics _toScroll = BouncingScrollPhysics();

  final List<bool> _isChecked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      titleSpacing: 0.0,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: card_background,
      ),
      title: Text('${widget.appliance} Service',
          style: TextStyle(color: Colors.black)),
      backgroundColor: card_background,
    );
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    // double heightStatusBarAppBar = MediaQuery.of(context).padding.top + _kToolbarHeight;

    double heightBody = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    double heightContent = ((widget.serviceList.length) * 82) + 40;
    print(heightContent);
    print(heightBody);
    if (heightContent < heightBody) {
      setState(() {
        _toScroll = NeverScrollableScrollPhysics();
      });
    }
    return Scaffold(
      backgroundColor: card_background,
      appBar: appBar,
      body: SingleChildScrollView(
        physics: _toScroll,
        child: Container(
            constraints: BoxConstraints(
                minHeight: heightScreen - 150, maxHeight: heightScreen - 50),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    "Select brand for your ",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: (widget.serviceList.length) * 82,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
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
      bottomNavigationBar: BottomAppBar(
        color: card_background,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                print(heightBody);
                print(widthScreen);
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CheckoutPage(
                                services: widget._checkedOptions,
                                brands: widget.brands,
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
