import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:servicezz_clone/models/brands_class.dart';
import 'package:servicezz_clone/models/list_from_database.dart';

class DatabaseServices {
  CollectionReference brands =
      FirebaseFirestore.instance.collection('servizz_collection');

  Stream<QuerySnapshot> get databaseStream {
    return brands.snapshots();
  }
}
