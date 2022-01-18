import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicezz_clone/screens/wallet.dart';
import 'package:servicezz_clone/shared/colors.dart';

class PaymentPreference extends StatefulWidget {
  const PaymentPreference({Key? key}) : super(key: key);

  @override
  _PaymentPreferenceState createState() => _PaymentPreferenceState();
}

class _PaymentPreferenceState extends State<PaymentPreference> {
  double walletBalance = 5.0;
  bool _payWithWallet = false;
  bool _payOnline = false;

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      titleSpacing: 0.0,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: navColor,
      ),
      title: const Text('Select Date / Time',
          style: TextStyle(color: Colors.black)),
      backgroundColor: card_background,
    );
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.white,
        constraints: BoxConstraints(
          minHeight: heightScreen,
          minWidth: widthScreen,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Payment Methods",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: card_background,
                    borderRadius: BorderRadius.circular(16.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.credit_card,
                    color: orangeColor,
                    size: 32,
                  ),
                  title: Text(
                    'Pay Online',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    "Cards,Netbanking & More",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  trailing: Checkbox(
                    activeColor: orangeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    value: _payOnline,
                    onChanged: (bool? value) {
                      setState(() {
                        _payOnline = value!;
                        _payWithWallet = false;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: card_background,
                    borderRadius: BorderRadius.circular(16.0)),
                child: ListTile(
                  leading: Icon(
                    Icons.account_balance_wallet_rounded,
                    color: orangeColor,
                    size: 32,
                  ),
                  title: Text(
                    'Pay Using Servizz Wallet',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    "Available balance Rs ${walletBalance}",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  trailing: Checkbox(
                    activeColor: orangeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    value: _payWithWallet,
                    onChanged: (bool? value) {
                      setState(() {
                        _payWithWallet = value!;
                        _payOnline = false;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _payOnline || _payWithWallet
          ? BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                    ),
                    backgroundColor: MaterialStateProperty.all(navColor),
                  ),
                  onPressed: () {
                    if (_payWithWallet && walletBalance < 750) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Wallet()));
                    } else if (_payOnline) {
                      print("razorpay");
                    }
                  },
                  child: walletBalance < 750 && _payWithWallet
                      ? const Text(
                          "Insufficient balance [Add Money]",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          "Place Order",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            )
          : null,
    );
  }
}
