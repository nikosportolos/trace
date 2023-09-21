import 'dart:io';

import 'package:path/path.dart';
import 'package:test/test.dart';
import 'package:trace/src/core/entry.dart';
import 'package:trace/src/core/level.dart';
import 'package:trace/src/filter/filters.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/loggers.dart';

void main() {
  const String message = 'This is an info message.';
  const LogLevel level = LogLevel.info;

  final Directory logDirectory = Directory(join(Directory.current.path, 'test', 'logs'));

  final LogFilter filter = DefaultLogFilter(level);
  final Logger logger = FileLogger(
    path: logDirectory.path,
    filter: filter,
    theme: LoggerTheme(
      sections: <LogSection>[
        LogSection.level,
        LogSection.message,
      ],
    ),
  );

  tearDownAll(() async {
    await logger.dispose();
    await logDirectory.delete(recursive: true);
  });

  group('FileLogger', () {
    test('print [LogLevel.info]', () async {
      final LogEntry entry = LogEntry.create(level: level, message: message);
      expect(filter.canLog(entry), true);

      logger.print(entry);

      final List<FileSystemEntity> files = logDirectory.listSync(recursive: true);
      expect(files.length, 1);

      await Future<void>.delayed(const Duration(milliseconds: 25));

      final File file = File(files.first.path);
      final String text = file.readAsStringSync();

      expect(text, 'INFO      This is an info message.\n');
    });
  });
}
