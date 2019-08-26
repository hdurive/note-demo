// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserLogged.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLogged _$UserLoggedFromJson(Map<String, dynamic> json) {
  return UserLogged(
    json['name'] as String,
    json['first_name'] as String,
    json['last_name'] as String,
    json['email'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$UserLoggedToJson(UserLogged instance) =>
    <String, dynamic>{
      'name': instance.name,
      'first_name': instance.fistName,
      'last_name': instance.lastName,
      'email': instance.email,
      'id': instance.id,
    };
