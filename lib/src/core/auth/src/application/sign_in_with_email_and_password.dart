import 'package:dartz/dartz.dart';
import 'package:flutter_skill_showcase/src/core/auth/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInWithEmailAndPassword {
  SignInWithEmailAndPassword(this._authService);

  final AuthService _authService;

  Future<Either<AuthFailure, Unit>> call(String email, String password) async {
    return await _authService.signInWithEmailAndPassword(email, password);
  }
}
