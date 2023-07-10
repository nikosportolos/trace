import 'dart:io';

import 'package:trace/src/formatter/formatter.dart';
import 'package:trace/src/logger/io.dart';

/// **ConsoleLogger**
///
/// A [Logger] that prints messages on the attached terminal.
class ConsoleLogger extends IoLogger {
  ConsoleLogger({
    final IOSink? ioSink,
    super.filter,
    super.level,
    final LogEntryFormatter? formatter,
  }) : super(
          ioSink: ioSink ?? stdout,
          formatter: formatter ?? LogEntryFormatter.ansi(),
        );
}
