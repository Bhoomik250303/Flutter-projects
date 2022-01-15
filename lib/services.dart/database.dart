import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:servicezz_clone/models/brands_class.dart';
import 'package:servicezz_clone/models/list_from_database.dart';

class DatabaseServices {
  final String? uid;

  DatabaseServices({this.uid});

  CollectionReference collection =
      FirebaseFirestore.instance.collection('servizz_collection');

  Stream<QuerySnapshot> get databaseStream {
    return collection.snapshots();
  }

  Future otherDescription(String? des) async {
    return await collection.doc(uid).set({'otherdescription': des});
  }

  Future userSelection(
      String? appliance, List<String>? selections, String? brand) async {
    return await collection.doc(uid).set({
      'appliance': appliance,
      'brand': brand,
      'selection': selections,
    });
  }

  // Stream get ;
  Stream<DocumentSnapshot> get gettingUserData {
    return collection.doc(uid).snapshots();
  }

  // Future userData(String name,String billingAddress,String shippingAddress,  )
}
