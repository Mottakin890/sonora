import 'package:sonora/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel({required super.id, required super.username, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> jsonUserModel) {
    return UserModel(
      id: jsonUserModel['id'],
      username: jsonUserModel['username'],
      email: jsonUserModel['email'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
  };
}
