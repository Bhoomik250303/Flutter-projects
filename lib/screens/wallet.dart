import 'package:flutter/material.dart';
import 'package:servicezz_clone/shared/colors.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int balance = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: card_background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                //DefaultTabController.of(context)?.animateTo(0);
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            SizedBox(
              width: 2.0,
            ),
            Text(
              "Wallet",
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.0,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: card_background,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0))),
        child: Container(
          margin: EdgeInsets.only(left: 20.0, top: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Add Money To Servizz Wallet",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 0.5),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Available balance Rs ${balance}',
                style: TextStyle(
                    color: orangeColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 32.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32.0),
                child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    maxLength: 5,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 20),
                        prefixIcon: Icon(
                          Icons.ac_unit,
                          color: Colors.grey[850],
                        ),
                        filled: true,
                        fillColor: Colors.grey[400],
                        counterText: "",
                        hintText: "Amount",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        // enabled: false,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0)))),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                "Minimum value should be Rs 100",
                style: TextStyle(
                    color: Colors.grey[600], fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(),
                  Container(),
                  Container(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
