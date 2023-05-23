import 'dart:io';

import 'package:ansix/ansix.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/loggers/console.dart';

class MockIoSink extends Mock implements IOSink {
  @override
  void write(Object? object);

  @override
  Future<dynamic> flush() async {}

  @override
  Future<dynamic> close() async {}
}

class MockLogFilter extends Mock implements LogFilter {
  @override
  bool canLog(final LogEntry entry) {
    return true;
  }
}

class MockLogEntry extends Mock implements LogEntry {
  MockLogEntry({
    this.message,
    required this.level,
  });

  @override
  final LogLevel level;
  @override
  final Object? message;
}

void main() {
  AnsiX.disable();

  const String message = 'This is an info message.';
  const LogLevel level = LogLevel.info;

  final MockIoSink sink = MockIoSink();
  final LogFilter filter = DefaultLogFilter(levelCallback: () => level);

  final ConsoleLogger logger = ConsoleLogger(
    ioSink: sink,
    logTimestamp: false,
    logLevel: false,
    filter: filter,
  );

  tearDown(() => resetMocktailState());

  group('ConsoleLogger', () {
    test('print', () {
      final LogEntry entry = LogEntry(level: level, message: message);
      logger.print(entry);
      expect(filter.canLog(entry), true);
      // verify(() => filter.canLog(entry)).called(1);
      verify(() => sink.write('${message.padRight(30)}\n')).called(1);
    });

    test("don't print LogLevel.none", () {
      final LogEntry entry = MockLogEntry(level: LogLevel.none);
      logger.print(entry);
      expect(filter.canLog(entry), false);
      verifyNever(() => sink.write(''));
    });

    test("don't print LogLevel.debug", () {
      final LogEntry entry = MockLogEntry(level: LogLevel.debug);
      logger.print(entry);
      expect(filter.canLog(entry), false);
      verifyNever(() => sink.write(''));
    });

    test('dispose', () async {
      await logger.dispose();
      verify(() async => await sink.flush()).called(1);
      verify(() async => await sink.close()).called(1);
    });
  });
}
