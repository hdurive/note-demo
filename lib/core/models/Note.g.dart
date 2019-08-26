// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    json['id'] as String,
    json['owner_email'] as String,
    json['title'] as String,
    json['description'] as String,
    NoteType.fromJson(json['note_type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'owner_email': instance.owner,
      'title': instance.title,
      'description': instance.description,
      'note_type': instance.noteType,
    };
