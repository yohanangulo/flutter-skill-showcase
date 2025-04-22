part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = AuthStarted;
  const factory AuthEvent.signedIn() = AuthSignedIn;
  const factory AuthEvent.signedOut() = AuthSignedOut;
}
