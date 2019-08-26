import 'package:json_annotation/json_annotation.dart';

part 'NoteType.g.dart';

enum NoteEnum { list, note }

@JsonSerializable(nullable: false)
class NoteType {
  static const FIREBASE_ID = "noteType";
  @JsonKey(name: 'note_type')
  final String noteType;

  NoteEnum noteEnum;

  NoteType(this.noteType);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory NoteType.fromJson(Map<String, dynamic> json) =>
      _$NoteTypeFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$NoteTypeToJson(this);

  static NoteEnum getNoteType(String noteType) {
    switch (noteType) {
      case "list":
        {
          return NoteEnum.list;
        }
    }
    return NoteEnum.note;
  }

  setNoteType(String noteType){
    switch (noteType) {
      case "list":
        {
          this.noteEnum = NoteEnum.note;
          break;
        }
      case "note":
        {
          this.noteEnum = NoteEnum.list;
          break;
        }
    }
  }


  static String get list => "list";

  static String get note => "note";
}
