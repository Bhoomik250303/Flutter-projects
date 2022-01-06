import 'package:flutter/material.dart';
import 'package:servicezz_clone/constants/class_of_brandlists.dart';
import 'package:servicezz_clone/constants/class_of_servicelists.dart';
import 'package:servicezz_clone/models/brands_class.dart';
import 'package:servicezz_clone/models/services_class.dart';
import 'package:servicezz_clone/shared/colors.dart';
import 'package:servicezz_clone/models/electronic_image_description.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: GridView.count(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 1.0,
          children: <TileModel>[
            TileModel(
                imageURL: "desktop",
                title: 'Desktop',
                subtitle: 'Services',
                details: ListOfBrands(
                  brandsList: ClassOfBrandLists().desktopBrands,
                  appliance: 'Desktop',
                  serviceList: ClassOfServiceList().desktopServices,
                )),
            TileModel(
                imageURL: 'laptop',
                title: 'Laptop',
                subtitle: 'Services',
                details: ListOfBrands(
                  appliance: 'Laptop',
                  brandsList: ClassOfBrandLists().laptopBrands,
                  serviceList: ClassOfServiceList().laptopServices,
                )),
            TileModel(
                imageURL: 'cccamera',
                title: 'Camera',
                subtitle: 'Services',
                details: ListOfServices(
                  appliance: 'CCTV',
                  serviceList: ClassOfServiceList().cctvServices,
                )),
            TileModel(
                imageURL: 'biometric',
                title: 'Biometric',
                subtitle: 'Services',
                details: ListOfServices(
                  appliance: 'Biometric',
                  serviceList: ClassOfServiceList().biometricServices,
                )),
            TileModel(
                imageURL: 'router',
                title: 'Router',
                subtitle: 'Services',
                details: ListOfServices(
                  appliance: 'Networking Services',
                  serviceList: ClassOfServiceList().networkServices,
                )),
            TileModel(
              imageURL: 'printer',
              title: 'Printer',
              subtitle: 'Services',
              details: ListOfBrands(
                appliance: 'Printer',
                brandsList: ClassOfBrandLists().printerBrands,
                serviceList: ClassOfServiceList().printerServices,
              ),
            ),
            TileModel(
                imageURL: 'onlinesupport',
                title: 'Online Support',
                subtitle: 'Services',
                details: ListOfServices(
                  appliance: 'Online',
                  serviceList: ClassOfServiceList().onlineServices,
                )),
            TileModel(
                imageURL: 'timepass',
                title: 'Desktop',
                subtitle: 'Services',
                details: Scaffold()),
            TileModel(
                imageURL: 'shoponline',
                title: 'Desktop',
                subtitle: 'Services',
                details: Scaffold()),
            TileModel(
                imageURL: 'bulkservice',
                title: 'Desktop',
                subtitle: 'Services',
                details: Scaffold()),
          ].map((TileModel tile) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => tile.details));
              },
              child: GridTile(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0)),
                    color: card_background,
                    elevation: 30.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Center(
                            child: Image.asset(
                              'asset/image/' + tile.imageURL + '.jpeg',
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 25,
                            left: 60,
                            child: Text(
                              tile.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Positioned(
                            bottom: 10,
                            left: 65,
                            child: Text(
                              tile.subtitle,
                              style: TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
