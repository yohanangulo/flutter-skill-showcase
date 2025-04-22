import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';

@injectable
class AppLogger {
  AppLogger(this._logger);

  final Logger _logger;

  void d(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.d(message, error: error, stackTrace: stackTrace);
  }

  void e(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void i(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.i(message, error: error, stackTrace: stackTrace);
  }

  void w(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.w(message, error: error, stackTrace: stackTrace);
  }

  void log(
    Level level,
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
  }) {
    _logger.log(level, message, error: error, stackTrace: stackTrace);
  }
}
