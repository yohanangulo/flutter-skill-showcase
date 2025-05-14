part of 'app_lifecycle_observer_cubit.dart';

@freezed
class AppLifecycleObserverState with _$AppLifecycleObserverState {
  factory AppLifecycleObserverState.resumed() = _Resumed;
  factory AppLifecycleObserverState.inactive() = _Inactive;
  factory AppLifecycleObserverState.paused() = _Paused;
  factory AppLifecycleObserverState.detached() = _Detached;
}
