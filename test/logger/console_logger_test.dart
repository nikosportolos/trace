import 'package:ansix/ansix.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filters.dart';
import 'package:trace/src/formatter/formatter.dart';
import 'package:trace/src/logger/loggers.dart';

import '../mocks.dart';

void main() {
  AnsiX.disable();

  const String message = 'This is an info message.';
  const LogLevel level = LogLevel.info;

  final MockIoSink sink = MockIoSink();
  final LogFilter filter = DefaultLogFilter(level);

  final IoLogger logger = ConsoleLogger(
    ioSink: sink,
    filter: filter,
    theme: LoggerTheme(
      sections: <LogSection>[
        LogSection.level,
        LogSection.message,
      ],
    ),
  );

  setUp(() => resetMocktailState());
  tearDown(() => resetMocktailState());

  group('ConsoleLogger', () {
    test('print [LogLevel.info]', () {
      final LogEntry entry = LogEntry.create(level: level, message: message);
      logger.log(entry);

      expect(filter.canLog(entry), true);
      verify(() => sink.write('INFO      ')).called(1);
      verify(() => sink.write(message)).called(1);
      verify(() => sink.write(AnsiEscapeCodes.newLine)).called(1);
    });

    test("don't print [LogLevel.none]", () {
      final LogEntry entry = MockLogEntry(level: LogLevel.none);
      logger.log(entry);
      expect(filter.canLog(entry), false);
      verifyNever(() => sink.write(''));
    });

    test("don't print [LogLevel.debug]", () {
      final LogEntry entry = MockLogEntry(level: LogLevel.debug);
      logger.log(entry);
      expect(filter.canLog(entry), false);
      verifyNever(() => sink.write(''));
    });

    test('dispose', () async {
      await logger.dispose();
      // verify(() => sink.flush()).called(1);
      // verify(() => sink.close()).called(1);
    });

    test('Default ConsoleLogger', () async {
      final Logger logger = ConsoleLogger();
      expect(
        logger.theme.sections,
        const <LogSection>[
          LogSection.timestamp,
          LogSection.level,
          LogSection.message,
        ],
      );

      expect(logger.theme.timestampFormat, r'H:i:s.vu');
      expect(logger.theme.colorMap, LoggerTheme.defaultColorMap);
      expect(logger.theme.stacktraceIndent, 4);
    });
  });
}
