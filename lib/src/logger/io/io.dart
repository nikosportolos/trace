import 'dart:io' if (dart.library.html) 'dart:html';

import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filters.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/io/writer.dart';
import 'package:trace/src/logger/logger.dart';
import 'package:trace/src/progress/progress_indicator.dart';

/// **IoLogger**
///
/// A [Logger] interface that uses an input [IOSink] to log messages.
class IoLogger implements Logger {
  IoLogger({
    final IOSink? ioSink,
    final LogFilter? filter,
    this.level = LogLevel.verbose,
    final LoggerTheme? theme,
    final bool allowAnsi = true,
  })  : theme = theme ?? LoggerTheme(),
        filter = filter ?? DefaultLogFilter(level),
        writer = SinkWriter.create(ioSink, allowAnsi);

  @override
  final LogFilter filter;

  @override
  LogLevel level;

  @override
  final LoggerTheme theme;

  final SinkWriter writer;

  ProgressIndicator? _progressIndicator;

  @override
  void log(final LogEntry entry) {
    if (!filter.canLog(entry)) {
      return;
    }

    for (final LogSection section in theme.sections) {
      final String? text =
          theme.sectionThemeMap[section]?.formatter.format(theme, entry);
      if (text != null) {
        writer.write(text);
      }
    }

    writer.write(AnsiEscapeCodes.newLine);
  }

  @override
  writeln(final Object? message) {
    writer.writeln(message);
  }

  @override
  void startProgress(final ProgressIndicator progress) =>
      _progressIndicator = progress;

  @override
  void stopProgress() => _progressIndicator = null;

  @override
  Future<void> dispose() async {
    await writer.dispose();
  }
}
