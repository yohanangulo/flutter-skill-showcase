import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skill_showcase/src/config/debug/logger/app_logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_lifecycle_observer_state.dart';
part 'app_lifecycle_observer_cubit.freezed.dart';

@lazySingleton
class AppLifecycleObserverCubit extends Cubit<AppLifecycleObserverState>
    with WidgetsBindingObserver {
  final AppLogger _logger;
  AppLifecycleObserverCubit(
    this._logger,
  ) : super(AppLifecycleObserverState.resumed()) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _logger.i('AppLifecycleObserverCubit: didChangeAppLifecycleState: $state');
    switch (state) {
      case AppLifecycleState.resumed:
        return emit(AppLifecycleObserverState.resumed());
      case AppLifecycleState.detached:
        return emit(AppLifecycleObserverState.detached());
      case AppLifecycleState.inactive:
        return emit(AppLifecycleObserverState.inactive());
      case AppLifecycleState.paused:
      default:
        return emit(AppLifecycleObserverState.paused());
    }
  }

  @override
  Future<void> close() async {
    WidgetsBinding.instance.removeObserver(this);
    super.close();
  }
}
