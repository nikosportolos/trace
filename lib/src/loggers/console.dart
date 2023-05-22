import 'dart:io';

import 'package:trace/src/core/formatter.dart';
import 'package:trace/src/loggers/io.dart';

/// **ConsoleLogger**
///
/// A [Logger] that prints messages on the attached terminal.
class ConsoleLogger extends IoLogger {
  ConsoleLogger({
    final IOSink? ioSink,
    super.filter,
    super.level,
    super.logLevel,
    super.logTimestamp,
  }) : super(
            ioSink: ioSink ?? stdout,
            formatter: LogEntryFormatter.ansi(
              level: logLevel,
              timestamp: logTimestamp,
            ));
}
