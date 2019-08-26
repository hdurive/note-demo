import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:notish/core/models/NoteType.dart';


part 'Note.g.dart';

@JsonSerializable(nullable: false)
class Note with ChangeNotifier {
  static const FIREBASE_ID = "note";
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'owner_email')
  final String owner;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'note_type')
  final NoteType noteType;


  Note(this.id, this.owner, this.title, this.description, this.noteType);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$NoteToJson(this);

  Note.fromMap(Map<String, dynamic> data)
      : this(
          data['id'],
          data['owner_email'],
          data['title'],
          data['description'],
          null,
        );

  toArrayDocument() {
    final map = {
      'id': this.id,
      'owner_email': this.owner,
      'title': this.title,
      'description': this.description,
      'note_type': this.noteType,
    };
    return map;
  }
}
