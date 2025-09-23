import 'dart:io' if (dart.library.html) 'dart:html';

import 'package:path/path.dart';
import 'package:trace/src/core/extensions.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/io/io.dart';
import 'package:trace/src/logger/logger.dart';

/// **FileLogger**
///
/// A [Logger] that prints messages to a file.
class FileLogger extends IoLogger {
  FileLogger({
    final String? path,
    final String? filename,
    final LoggerTheme? theme,
    super.level,
    super.filter,
  }) : super(
         allowAnsi: false,
         theme: theme ?? LoggerTheme(),
         ioSink: File(_getLogPath(path, filename)).safeOpen(),
       );

  static String _getLogPath(
    final String? path,
    final String? filename,
  ) {
    late final String logPath;

    if ((path == null || path.isEmpty || path == '.')) {
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
