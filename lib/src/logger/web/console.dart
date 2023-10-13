import 'package:trace/src/logger/web/io.dart';

/// **ConsoleLogger**
///
/// A [Logger] that prints messages on the attached terminal.
class ConsoleLogger extends IoLogger {
  ConsoleLogger({
    super.level,
    super.theme,
    super.filter,
  });
}
