import 'package:flutter/material.dart';
import 'package:servicezz_clone/colors.dart';
import 'package:servicezz_clone/models/electronic_image_description.dart';
import 'package:servicezz_clone/screens/desktop_info.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
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
                details: 'desktopDetails'),
            TileModel(
                imageURL: 'laptop',
                title: 'Laptop',
                subtitle: 'Services',
                details: 'desktopDetails'),
            TileModel(
                imageURL: 'cccamera',
                title: 'Camera',
                subtitle: 'Services',
                details: 'desktopDetails'),
            TileModel(
                imageURL: 'biometric',
                title: 'Desktop',
                subtitle: 'Services',
                details: 'desktopDetails'),
            TileModel(
                imageURL: 'router',
                title: 'Desktop',
                subtitle: 'Services',
                details: 'desktopDetails'),
            TileModel(
                imageURL: 'printer',
                title: 'Desktop',
                subtitle: 'Services',
                details: 'desktopDetails'),
            TileModel(
                imageURL: 'onlinesupport',
                title: 'Desktop',
                subtitle: 'Services',
                details: 'desktopDetails'),
            TileModel(
                imageURL: 'timepass',
                title: 'Desktop',
                subtitle: 'Services',
                details: 'desktopDetails'),
            TileModel(
                imageURL: 'shoponline',
                title: 'Desktop',
                subtitle: 'Services',
                details: 'desktopDetails'),
            TileModel(
                imageURL: 'bulkservice',
                title: 'Desktop',
                subtitle: 'Services',
                details: 'desktopDetails'),
          ].map((TileModel tile) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GridInfo1()));
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
