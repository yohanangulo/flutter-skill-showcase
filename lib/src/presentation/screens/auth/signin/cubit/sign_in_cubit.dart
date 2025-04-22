import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_skill_showcase/src/core/auth/domain.dart';
import 'package:flutter_skill_showcase/src/core/auth/src/application/sign_in_with_email_and_password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInWithEmailAndPassword) : super(SignInState.initial());

  final SignInWithEmailAndPassword _signInWithEmailAndPassword;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(state.copyWith(isLoading: true));

    final failureOrSuccess = await _signInWithEmailAndPassword(email, password);

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            signInFailureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (_) {
        emit(state.copyWith(signInFailureOrSuccessOption: some(right(unit))));
      },
    );
  }
}
