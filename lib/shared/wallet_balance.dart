import 'package:flutter/material.dart';

class WalletBalance extends StatelessWidget {
  const WalletBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int moneyInWallet = 0;
    return Scaffold(
      body: ListTile(
        leading: Icon(Icons.account_balance_wallet_rounded),
        title: Text("Wallet Balance"),
        subtitle: GestureDetector(onTap: () {}, child: Text("Add Money")),
        trailing: Stack(
          children: <Widget>[
            Text("${moneyInWallet}"),
          ],
        ),
      ),
    );
  }
}
