import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:servicezz_clone/models/brands_class.dart';
import 'package:servicezz_clone/models/list_from_database.dart';

class DatabaseServices {
  String? uid;
  DatabaseServices({this.uid});

  CollectionReference collection =
      FirebaseFirestore.instance.collection('servizz_collection');

  Stream<QuerySnapshot> get databaseStream {
    return collection.snapshots();
  }

  Future otherDescription(String des) async {
    return await collection.doc('userData').collection(uid!).doc().set({'description': des});
  }

  Future userSelection(
      String des, String appliance, List<String> selections) async {
    return await collection.doc(uid).set({
      'appliance': appliance,
      'selection': selections,
      'Otherdescription': des
    });
  }

  Stream<DocumentSnapshot> get gettingUserData {
    return collection.doc('userData').snapshots();
  }

  // Future userData(String name,String billingAddress,String shippingAddress,  )
}
