import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/core/formatter.dart';

/// **IoLogger**
///
/// A [Logger] interface that uses an input [IOSink] to log messages.
abstract class IoLogger implements Logger {
  IoLogger({
    required final IOSink ioSink,
    final LogFilter? filter,
    this.level = LogLevel.verbose,
    final bool logLevel = true,
    final bool logTimestamp = true,
    final LogEntryFormatter? formatter,
  })  : _sink = ioSink,
        filter = filter ?? DefaultLogFilter(levelCallback: () => level),
        formatter = formatter ??
            LogEntryFormatter.standard(
              level: logLevel,
              timestamp: logTimestamp,
            );

  @override
  final LogFilter filter;

  @override
  final LogEntryFormatter formatter;

  @override
  LogLevel level;

  final IOSink _sink;

  @override
  void print(final LogEntry entry) {
    if (!filter.canLog(entry)) {
      return;
    }

    _sink.write(
      '${formatter.format(entry)}${AnsiEscapeCodes.newLine}',
    );
  }

  @override
  Future<void> dispose() async {
    await _sink.flush();
    await _sink.close();
  }
}
