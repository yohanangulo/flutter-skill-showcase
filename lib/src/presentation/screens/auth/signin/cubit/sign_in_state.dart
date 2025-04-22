part of 'sign_in_cubit.dart';

@freezed
abstract class SignInState with _$SignInState {
  factory SignInState({
    required bool isLoading,
    required Option<Either<AuthFailure, Unit>> signInFailureOrSuccessOption,
  }) = _SignInState;

  factory SignInState.initial() {
    return SignInState(isLoading: false, signInFailureOrSuccessOption: none());
  }
}
