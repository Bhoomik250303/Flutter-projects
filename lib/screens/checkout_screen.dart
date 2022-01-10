import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicezz_clone/shared/colors.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage(
      {this.brands,
      required this.height,
      required this.services,
      required this.width,
      required this.appliance});
  double height;
  double width;
  List<String> services = ['svsvsdv'];
  String? brands;
  String appliance;

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<String> services = [];
  @override
  Widget build(BuildContext context) {
    setState(() {
      services = widget.services;
    });
    double heightContent = (widget.services.length * 60) + 502;
    AppBar appBar = AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      titleSpacing: 0.0,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: card_background,
      ),
      title: Text('Place Order', style: TextStyle(color: Colors.black)),
      backgroundColor: card_background,
    );
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    ScrollPhysics _toScroll = BouncingScrollPhysics();

    if (heightContent < heightScreen) {
      setState(() {
        _toScroll = NeverScrollableScrollPhysics();
      });
    }
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        physics: _toScroll,
        child: Container(
            constraints: BoxConstraints(
                minHeight: heightScreen - 150, maxHeight: heightScreen + 100),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    "${widget.appliance} Service",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24.0),
                    ),
                    color: card_background,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: (widget.services.length) * 60,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          services[index],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0),
                        ),
                        trailing: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          child: Container(
                            width: 30.0,
                            height: 30.0,
                            color: orangeColor,
                            child: Center(
                                child: IconButton(
                              icon: Icon(
                                Icons.delete,
                                size: 15,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (widget.services.length == 1) {
                                  setState(() {
                                    widget.services.removeAt(index);
                                  });
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    widget.services.removeAt(index);
                                  });
                                }
                              },
                            )),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    color: yellow_checkout,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: ListTile(
                    horizontalTitleGap: 32.0,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: const Text('Number of devices'),
                    ),
                    subtitle: const Text(
                        'For another device you have to book new order'),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        color: Colors.white,
                        child: Center(child: Text("1")),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    color: orangeColorBackground,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: ListTile(
                    horizontalTitleGap: 32.0,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    title: Text(
                      'Apply Coupon',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: orangeColor),
                    ),
                    trailing: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.0),
                      ),
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        color: orangeColor,
                        child: Center(
                            child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            size: 15,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Text('Service charges',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Text(
                          'Rs 636',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        leading: Text('GST',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Text('Rs 114',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
          color: navColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: ListTile(
              leading: Text(
                "Total: Rs 750",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.9),
              ),
              trailing: GestureDetector(
                onTap: () {},
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  child: Container(
                    color: orangeColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Text(
                        "Proceed",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
