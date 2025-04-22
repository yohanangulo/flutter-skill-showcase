import 'package:dartz/dartz.dart';
import 'package:flutter_skill_showcase/src/core/auth/domain.dart';

abstract class AuthService {
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> signOut();
}
