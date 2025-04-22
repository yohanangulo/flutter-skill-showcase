import 'package:dartz/dartz.dart';
import 'package:flutter_skill_showcase/src/core/auth/domain.dart';
import 'package:flutter_skill_showcase/src/core/auth/src/infrastructure/user_data_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthService)
class AuthServiceImpl implements AuthService {
  AuthServiceImpl(this._userDataStoarge);

  final UserDataStorage _userDataStoarge;

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    _userDataStoarge.saveAccessToken('accessToken');
    _userDataStoarge.saveRefreshToken('refreshToken');

    return right(unit);
  }

  @override
  Future<void> signOut() async {
    _userDataStoarge.deleteAccessToken();
    _userDataStoarge.deleteRefreshToken();
  }
}
