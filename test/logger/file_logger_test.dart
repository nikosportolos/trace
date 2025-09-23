import 'dart:io' if (dart.library.html) 'dart:html';

import 'package:ansix/ansix.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';
import 'package:trace/src/core/entry.dart';
import 'package:trace/src/core/extensions.dart';
import 'package:trace/src/core/level.dart';
import 'package:trace/src/filter/filters.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/loggers.dart';

void main() {
  const String message = 'This is an info message.';
  const LogLevel level = LogLevel.info;

  final Directory logDirectory = Directory(
    join(Directory.current.path, 'test', 'logs'),
  );

  final LogFilter filter = DefaultLogFilter(level);
  final IoLogger logger = FileLogger(
    path: logDirectory.path,
    filter: filter,
    theme: LoggerTheme(
      sections: <LogSection>[
        LogSection.timestamp,
        LogSection.level,
        LogSection.message,
      ],
      timestampFormat: 'd/m/Y',
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

      logger.log(entry);
      logger.writeln('testing writeln');

      final List<FileSystemEntity> files = logDirectory.listSync(
        recursive: true,
      );
      expect(files.length, 1);

      await logger.dispose();

      final File file = File(files.first.path);
      final String text = file.readAsStringSync();

      final DateTime now = DateTime.now();
      final String timestamp =
          '${now.day.padded()}/${now.month.padded()}/${now.year}';
      final String expected =
          '$timestamp        INFO      This is an info message.\ntesting writeln\n';

      expect(text, expected);
    });

    test('Default FileLogger', () async {
      final IoLogger logger = FileLogger();

      expect(
        logger.theme.sections,
        const <LogSection>[
          LogSection.timestamp,
          LogSection.level,
          LogSection.message,
        ],
      );
      expect(logger.theme.timestampFormat, r'H:i:s.vu');
      expect(logger.theme.colorMap, <LogLevel, AnsiColor>{});
      expect(logger.theme.stacktraceIndent, 4);
    });
  });
}
