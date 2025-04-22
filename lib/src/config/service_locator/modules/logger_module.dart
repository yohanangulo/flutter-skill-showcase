import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class LoggerModule {
  @lazySingleton
  Logger get logger {
    return Logger(printer: PrettyPrinter(colors: false));
  }
}
