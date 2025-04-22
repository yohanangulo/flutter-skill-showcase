import 'package:bloc/bloc.dart';
import 'package:flutter_skill_showcase/src/core/auth/src/application/log_out.dart';
import 'package:flutter_skill_showcase/src/core/auth/src/infrastructure/user_data_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.userDataStoarge, this._logOut) : super(const Unknown()) {
    on<AuthStarted>(_onStarted);
    on<AuthSignedIn>(_onSignedIn);
    on<AuthSignedOut>(_onSignedOut);
  }

  final UserDataStorage userDataStoarge;
  final LogOut _logOut;

  void _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    final accessToken = await userDataStoarge.getAccessToken();

    await Future.delayed(const Duration(seconds: 1));

    if (accessToken.isNotEmpty) {
      emit(const Authenticated());
    } else {
      emit(const Unauthenticated());
    }
  }

  void _onSignedIn(AuthSignedIn event, Emitter<AuthState> emit) {
    emit(const Authenticated());
  }

  void _onSignedOut(AuthSignedOut event, Emitter<AuthState> emit) {
    _logOut();
    emit(const Unauthenticated());
  }
}
