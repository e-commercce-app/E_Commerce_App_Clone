part of 'password_check_bloc.dart';

sealed class PasswordCheckState extends Equatable {
  const PasswordCheckState();
  
  @override
  List<Object> get props => [];
}

final class PasswordCheckInitial extends PasswordCheckState {}
