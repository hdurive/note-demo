// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NoteType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteType _$NoteTypeFromJson(Map<String, dynamic> json) {
  return NoteType(
    json['note_type'] as String,
  )..noteEnum = _$enumDecode(_$NoteEnumEnumMap, json['noteEnum']);
}

Map<String, dynamic> _$NoteTypeToJson(NoteType instance) => <String, dynamic>{
      'note_type': instance.noteType,
      'noteEnum': _$NoteEnumEnumMap[instance.noteEnum],
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

const _$NoteEnumEnumMap = <NoteEnum, dynamic>{
  NoteEnum.list: 'list',
  NoteEnum.note: 'note'
};
