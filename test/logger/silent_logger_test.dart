import 'package:ansix/ansix.dart';
import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/loggers.dart';

void main() {
  const String message = 'This is an info message.';
  const LogLevel level = LogLevel.info;

  final Logger logger = SilentLogger();

  tearDownAll(() => logger.dispose());

  group('SilentLogger', () {
    test('smoke test', () {
      // expect(logger.formatter.theme, isEmpty);
      expect(logger.level, LogLevel.none);
      logger.level = LogLevel.debug;
      expect(logger.level, LogLevel.none);
    });

    test('print [$level]', () {
      final LogEntry entry = LogEntry.create(level: level, message: message);
      logger.log(entry);
    });

    test('theme', () {
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
