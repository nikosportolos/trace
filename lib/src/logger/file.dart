import 'dart:io';

import 'package:path/path.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/io.dart';

/// **FileLogger**
///
/// A [Logger] that prints messages to a file.
class FileLogger extends IoLogger {
  FileLogger({
    final String? path,
    final String? filename,
    final LoggerTheme? theme,
    super.filter,
    super.level,
  }) : super(
          ioSink: File(_getLogPath(path, filename)).safeOpen(),
          theme: theme ?? LoggerTheme(),
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

    return join(logPath, filename ?? _getFileName());
  }

  static String _getFileName() {
    final DateTime now = DateTime.now();

    final String month = now.month.padded();
    final String day = now.day.padded();
    final String hour = now.hour.padded();
    final String minute = now.minute.padded();
    final String second = now.second.padded();

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

extension on int {
  String padded() => toString().padLeft(2, '0');
}
