

import 'package:json_annotation/json_annotation.dart';

part 'UserLogged.g.dart';

@JsonSerializable(nullable: false)
class UserLogged{
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'first_name')
  final String fistName;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'id')
  final String id;

  
  UserLogged(this.name, this.fistName, this.lastName, this.email, this.id);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory UserLogged.fromJson(Map<String, dynamic> json) => _$UserLoggedFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserLoggedToJson(this);


}