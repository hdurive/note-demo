import 'package:cloud_firestore/cloud_firestore.dart';

class ApiFirestore{
  final Firestore db = Firestore.instance;

  CollectionReference getDataCollection(String path) {
    return db.collection(path);
  }
  DocumentReference getDocument(String path) {
    return db.document(path);
  }

}