
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:notish/core/models/NoteType.dart';
import 'Note.dart';


part 'User.g.dart';

@JsonSerializable(nullable: false)
class User with ChangeNotifier{
  static const FIREBASE_ID = "user";
  static const COLLECTION_NOTES = "notes_collection";
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'photoUrl')
  final String photoUrl;
  @JsonKey(name: 'notes')
  final List<Note> notes;



  User(this.id, this.email, this.name, this.photoUrl, this.notes);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User.fromMap(Map<String, dynamic> data)
      : this(
    data['id'],
    data['email'],
    data['name'],
    data['photoUrl'],
    data['notes'] != null ? List<Note>.from(data['notes']) : null,
  );


  toArrayDocument(){
    final map = {
      'id':this.id,
      'email': this.email,
      'name' : this.name,
      'photoUrl': this.photoUrl,
      'notes': this.notes
    };
    return map;
  }

}