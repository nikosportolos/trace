import 'package:trace/src/core/entry.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/logger.dart';
import 'package:trace/src/logger/web/web.dart';

/// **FileLogger**
///
/// A [Logger] that prints messages to a file.
class FileLogger extends WebLogger {
  FileLogger({
    final String? path,
    final String? filename,
    final LoggerTheme? theme,
    super.filter,
    super.level,
  }) : super(theme: theme ?? LoggerTheme());

  @override
  void log(final LogEntry entry) {}

  @override
  void write(final Object? message) {}
}
