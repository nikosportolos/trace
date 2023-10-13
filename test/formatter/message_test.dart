import 'package:ansix/ansix.dart';
import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/formatter/formatter.dart';

void main() {
  const LogSectionFormatter formatter = MessageFormatter();

  final LoggerTheme defaultTheme = LoggerTheme();
  const String message = 'This is a test message.';
  const String error = 'This is a test error message.';
  const LogLevel level = LogLevel.verbose;
  final DateTime timestamp = DateTime.now();
  final String tab = ' ' * defaultTheme.stacktraceIndent;
  final StackTrace stacktrace = StackTrace.current;
  final String formattedStacktrace =
      stacktrace.toString().split(AnsiEscapeCodes.newLine).map((String s) => '$tab$s').join(AnsiEscapeCodes.newLine);

  group('MessageFormatter', () {
    group('Default LoggerTheme', () {
      test('Format message', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(message: message, level: level, timestamp: timestamp),
          ),
          message,
        );
      });

      test('Format error', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(error: error, level: level, timestamp: timestamp),
          ),
          error,
        );
      });

      test('Format empty stacktrace', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              stacktrace: StackTrace.empty,
              level: level,
              timestamp: timestamp,
            ),
          ),
          '\n$tab${StackTrace.empty}',
        );
      });

      test('Format stacktrace', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              stacktrace: stacktrace,
              level: level,
              timestamp: timestamp,
            ),
          ),
          '\n$formattedStacktrace',
        );
      });

      test('Format message, error & stacktrace', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              message: message,
              error: error,
              stacktrace: stacktrace,
              level: level,
              timestamp: timestamp,
            ),
          ),
          '$message\n$tab$error\n$formattedStacktrace',
        );
      });
    });

    group('Custom LoggerTheme', () {
      test('Format message', () {
        expect(
          formatter.format(
            LoggerTheme(
              sections: <LogSection>[LogSection.level],
              colorMap: LoggerTheme.defaultColorMap,
            ),
            LogEntry(message: message, level: level, timestamp: timestamp),
          ),
          '\x1B[38;5;250mThis is a test message.\x1B[0m',
        );
      });
    });
  });
}
