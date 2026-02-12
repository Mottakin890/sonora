import 'package:equatable/equatable.dart';
import 'package:sonora/domain/entities/user_entities.dart';

abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthState {
  final UserEntities user;
  AuthenticatedState({required this.user});
  @override
  List<Object?> get props => [user];
}

class UnAuthenticatedState extends AuthState{
  @override
  List<Object?> get props => [];
  
}

class AuthErrorState extends AuthState {
  final String errMsg;
  AuthErrorState({required this.errMsg});
  @override
  List<Object?> get props => [errMsg];
}
