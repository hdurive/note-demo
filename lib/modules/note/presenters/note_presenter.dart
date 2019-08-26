import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:notish/core/models/Note.dart';
import 'package:notish/core/models/User.dart';
import 'package:notish/core/services/api_firestore.dart';
import 'package:notish/locator.dart';
import 'package:notish/shared_state/loading.dart';
import 'package:notish/utils/URLS.dart';
import 'package:notish/shared_state/shared_memory.dart';


class NotePresenter {
  final apiFirestore = locator<ApiFirestore>();


  Future<void> addNote({String noteName, String description}) async {
    return await apiFirestore.db.runTransaction((transaction) {
      var document = apiFirestore
          .getDocument(URLS_FIRESTORE.FIREBASE_USERS_COLLECTION +
              "/" +
              SharedMemory.userFirebase.email)
          .collection(User.COLLECTION_NOTES)
          .document();

      final note = Note(document.documentID, SharedMemory.userFirebase.email,
           noteName, description, null);

      apiFirestore
          .getDocument(URLS_FIRESTORE.FIREBASE_USERS_COLLECTION +
              "/" +
              SharedMemory.userFirebase.email)
          .collection(User.COLLECTION_NOTES)
          .document(document.documentID)
          .setData(note.toArrayDocument());
      return null;
    });
  }
}
