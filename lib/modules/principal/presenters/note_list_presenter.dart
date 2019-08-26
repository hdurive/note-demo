import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notish/core/models/Note.dart';
import 'package:notish/core/models/User.dart';
import 'package:notish/core/services/api_firestore.dart';
import 'package:notish/utils/URLS.dart';
import 'package:notish/shared_state/shared_memory.dart';

import '../../../locator.dart';

class NotesCollection with ChangeNotifier {
  List<Note> listNotes;

  NotesCollection() {
    this.listNotes = List();
  }

  setNotes(List<Note> listNotes) {
    this.listNotes = listNotes;
    notifyListeners();
  }
}

class NoteListPresenter {
  final apiFirestore = locator<ApiFirestore>();
  final NotesCollection notesCollectionProvider = NotesCollection();

  void listenAllNotes() {
    apiFirestore
        .getDocument(URLS_FIRESTORE.FIREBASE_USERS_COLLECTION +
            "/" +
            SharedMemory.userFirebase.email)
        .collection(User.COLLECTION_NOTES)
        .snapshots()
        .listen((data) {
          if(data!=null){
            var list=data.documents.map((data) => Note.fromMap(data.data));
            list=list.toList();
            notesCollectionProvider
                .setNotes(list);
          }

    });
  }

}
