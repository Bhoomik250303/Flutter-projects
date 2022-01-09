import 'package:flutter/cupertino.dart';

class TileModel {
  String imageURL;
  String title;
  String subtitle;
  Widget details;
  TileModel(
      {required this.imageURL,
      required this.title,
      required this.subtitle,
      required this.details});
}
