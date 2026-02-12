import 'package:sonora/domain/entities/user_entities.dart';

class UserModel extends UserEntities {
  UserModel({required super.id, required super.username, required super.email});

  factory UserModel.fromJson(Map<String, dynamic> jsonUserModel) {
    return UserModel(
      id: jsonUserModel['id'] as String,
      username: jsonUserModel['username'] as String,
      email: jsonUserModel['email'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'email': email,
  };
}
