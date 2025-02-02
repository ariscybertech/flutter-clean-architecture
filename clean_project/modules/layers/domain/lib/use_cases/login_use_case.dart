import 'dart:async';

import 'package:domain/core/use_case.dart';
import 'package:domain/model/generic_user.dart';
import 'package:domain/repositories/user_repository.dart';

class LoginUseCase extends UseCase<GenericUser, LoginUseCaseParams> {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository) : super();

  @override
  Future<GenericUser> execute(LoginUseCaseParams params) async {
    try {
      await _userRepository.authenticate(
          email: params.email, password: params.password);
      GenericUser user = await _userRepository.getUser();
      return user;
    } catch (ex) {
      rethrow;
    }
  }
}

class LoginUseCaseParams {
  String email;
  String password;

  LoginUseCaseParams({required this.email, required this.password});
}
