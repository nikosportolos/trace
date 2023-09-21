import 'dart:io';

import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/io.dart';

/// **ConsoleLogger**
///
/// A [Logger] that prints messages on the attached terminal.
class ConsoleLogger extends IoLogger {
  ConsoleLogger({
    final IOSink? ioSink,
    super.filter,
    super.level,
    final LoggerTheme? theme,
  }) : super(
          ioSink: ioSink ?? stdout,
          theme: theme ?? LoggerTheme(colorMap: LoggerTheme.defaultColorMap),
        );
}
