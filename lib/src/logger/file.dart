import 'dart:io';

import 'package:path/path.dart';
import 'package:trace/src/formatter/formatter.dart';
import 'package:trace/src/logger/io.dart';

/// **FileLogger**
///
/// A [Logger] that prints messages to a file.
class FileLogger extends IoLogger {
  FileLogger({
    final String? path,
    final String? filename,
    super.filter,
    super.level,
    final LogEntryFormatter? formatter,
  }) : super(
          ioSink: File(_getLogPath(path, filename)).safeOpen(),
          formatter: formatter ?? LogEntryFormatter.$default(),
        );

  static String _getLogPath(
    final String? path,
    final String? filename,
  ) {
    late final String logPath;

    if (path == null || path.isEmpty || path == '.') {
      logPath = join(Directory.current.path, 'logs');
    } else {
      logPath = path;
    }

    return join(logPath, filename ?? _getFilePath());
  }

  static String _getFilePath() {
    final DateTime now = DateTime.now();

    final String month = now.month.toString().padLeft(2, '0');
    final String day = now.day.toString().padLeft(2, '0');
    final String hour = now.hour.toString().padLeft(2, '0');
    final String minute = now.minute.toString().padLeft(2, '0');
    final String second = now.second.toString().padLeft(2, '0');

    return '${now.year}$month${day}_$hour$minute$second.log';
  }
}

extension on File {
  IOSink safeOpen() {
    if (!existsSync()) {
      createSync(recursive: true);
    }

    return openWrite();
  }
}
