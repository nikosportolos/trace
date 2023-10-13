import 'package:trace/src/core/entry.dart';
import 'package:trace/src/logger/logger.dart';
import 'package:trace/src/logger/web/io.dart';

/// **FileLogger**
///
/// A [Logger] that prints messages to a file.
///
/// **FileLogger** is NOT supported on the web.
class FileLogger extends IoLogger {
  FileLogger({
    final String? path,
    final String? filename,
    super.level,
    super.theme,
    super.filter,
  });

  @override
  void log(final LogEntry entry) {}

  @override
  void writeln(final Object? message) {}
}
