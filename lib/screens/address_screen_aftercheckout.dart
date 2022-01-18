import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicezz_clone/shared/body.dart';
import 'package:servicezz_clone/shared/colors.dart';

class AddressAfterCheckout extends StatefulWidget {
  const AddressAfterCheckout({Key? key}) : super(key: key);

  @override
  AddressStateAfterCheckout createState() => AddressStateAfterCheckout();
}

class AddressStateAfterCheckout extends State<AddressAfterCheckout> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    AppBar appBar = AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      titleSpacing: 0.0,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: navColor,
      ),
      title: const Text('Address details',
          style: TextStyle(
            color: Colors.black,
          )),
      backgroundColor: card_background,
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        constraints: BoxConstraints(
          minHeight: heightScreen,
          minWidth: widthScreen,
        ),
        color: Colors.white,
        child:Column(
          children: <Widget>[
            Container(
               
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
