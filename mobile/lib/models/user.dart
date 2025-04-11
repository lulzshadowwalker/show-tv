import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    required String avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['attributes']['name'],
      email: json['attributes']['email'],
      avatar: json['attributes']['avatar'],
    );
  }
}
