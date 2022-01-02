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
    "Dell",
    "Lenovo",
    "Asus",
    "Acer",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: card_background,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: card_background,
        ),
        backgroundColor: card_background,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
          ),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0))),
          child: CheckboxGroup(
            labels: _listOfBrands,
            checked: _isChecked,
            onSelected: (List<String> _isSelected) {
              setState(() {
                if (_isSelected.length > 1) {
                  _isSelected.removeAt(0);
                } else {
                  print('Only one selected');
                }
                _isChecked = _isSelected;
              });
            },
          )),
    );
  }
}
