import 'package:flutter_skill_showcase/src/core/auth/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogOut {
  LogOut(this._authService);

  final AuthService _authService;

  Future<void> call() async {
    await _authService.signOut();
  }
}
