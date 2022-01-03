import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:servicezz_clone/colors.dart';

class GridInfo1 extends StatefulWidget {
  const GridInfo1({Key? key}) : super(key: key);

  @override
  _GridInfo1State createState() => _GridInfo1State();
}

class _GridInfo1State extends State<GridInfo1> {
  List<String> _isChecked = [];

  final List<String> _listOfBrands = [
    "HP",
    "DELL",
    "LENOVO",
    "ASUS",
    "ACER",
    "HCL",
    "WIPRO",
    "IBM",
    "OTHER"
  ];

  ButtonStyle _buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(buttonColorBrands),
      elevation: MaterialStateProperty.all(0.0));

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

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
            constraints: BoxConstraints(maxHeight: heightScreen - 150),
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
                    labels: _listOfBrands,
                    labelStyle: TextStyle(fontSize: 18.0),
                    activeColor: orangeColor,
                    onSelected: (String value) {
                      setState(() {
                        _buttonStyle = ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            elevation: MaterialStateProperty.all(0.0));
                      });
                      if (_isChecked.isEmpty) {
                        _isChecked.add(value);
                      } else {
                        _isChecked.removeAt(0);
                        _isChecked.add(value);
                      }
                    },
                  ),
                  // Container(
                  //   height: heightScreen - 400,
                  //   width: widthScreen,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.vertical,
                  //       itemCount: _listOfBrands.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return ListTile(
                  //           leading: Icon(
                  //             Icons.circle_outlined,
                  //             color: orangeColor,
                  //           ),
                  //           title: Text(_listOfBrands[index]),
                  //         );
                  //       }),
                  // ),
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
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: BottomAppBar(
          color: card_background,
          child: TextButton(
            style: _buttonStyle.copyWith(
                elevation: MaterialStateProperty.all(0.0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)))),
            child: Text(
              "Proceed",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
