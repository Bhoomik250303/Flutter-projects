import 'package:flutter/material.dart';
import 'package:servicezz_clone/screens/wallet.dart';

class WalletBalance extends StatelessWidget {
  const WalletBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int moneyInWallet = 0;
    return Scaffold(
      body: ListTile(
        leading: Icon(Icons.account_balance_wallet_rounded),
        title: Text("Wallet Balance"),
        subtitle: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Wallet()));
            },
            child: Text("Add Money")),
        trailing: Text("${moneyInWallet}"),
      ),
    );
  }
}
