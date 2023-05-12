import 'dart:io';

import 'package:path/path.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/format/format.dart';

class FileLogger implements Logger {
  FileLogger({
    final String? path,
    final String? filename,
    final LogFilter? filter,
    this.level = LogLevel.none,
    final bool logLevel = true,
    final bool logTimestamp = true,
  })  : filter = filter ?? DefaultLogFilter(levelCallback: () => level),
        formatters = LogFormatter.defaultFormat(
          level: logLevel,
          timestamp: logTimestamp,
        ) {
    if (path == null || path.isEmpty || path == '.') {
      directory = Directory(path!);
    } else {
      directory = Directory(
        join(Directory.current.path, 'logs'),
      );
    }

    this.filename = filename ?? _getFilePath();
  }

  @override
  final LogFilter filter;

  @override
  final List<LogFormatter> formatters;

  late final Directory directory;
  late final String filename;

  @override
  LogLevel level = LogLevel.info;

  @override
  Future<void> init() async {}

  @override
  void print(final LogEntry entry) {}

  @override
  Future<void> dispose() async {}

  String _getFilePath() {
    final DateTime now = DateTime.now();

    final String month = now.month.toString().padLeft(2, '0');
    final String day = now.day.toString().padLeft(2, '0');
    final String hour = now.hour.toString().padLeft(2, '0');
    final String minute = now.minute.toString().padLeft(2, '0');
    final String second = now.second.toString().padLeft(2, '0');

    return '${now.year}$month${day}_$hour$minute$second.log';
  }
}
