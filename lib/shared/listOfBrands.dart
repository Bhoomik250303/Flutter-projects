import 'package:flutter/material.dart';

class ListOfBrands extends StatefulWidget {
  const ListOfBrands({Key? key}) : super(key: key);

  @override
  LlistStateOfBrands createState() => LlistStateOfBrands();
}

class LlistStateOfBrands extends State<ListOfBrands> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 1,
        children: [],
      ),
    );
  }
}
