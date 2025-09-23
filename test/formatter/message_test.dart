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

  final Map<String, dynamic> data = <String, dynamic>{
    'user_id': 123,
    'email': 'tester@test.com',
    'is_admin': true,
  };
  const String printedData = '''

    {
      "user_id": 123,
      "email": "tester@test.com",
      "is_admin": true
    }''';

  const String mockStacktrace = '''
#0      main (file:///D:/trace/test/formatter/message_test.dart:28:44)
#1      _rootRun (dart:async/zone.dart:1399:13)
#2      _CustomZone.run (dart:async/zone.dart:1301:19)
#3      _runZoned (dart:async/zone.dart:1804:10)
#4      runZoned (dart:async/zone.dart:1747:10)
#5      Declarer.declare (package:test_api/src/backend/declarer.dart:169:7)
#6      RemoteListener.start.<anonymous closure>.<anonymous closure> (package:test_api/src/backend/remote_listener.dart:120:24)
<asynchronous suspension>''';

  const String formattedStacktrace = '''
    #0      main (file:///D:/trace/test/formatter/message_test.dart:28:44)
    #1      _rootRun (dart:async/zone.dart:1399:13)
    #2      _CustomZone.run (dart:async/zone.dart:1301:19)
    #3      _runZoned (dart:async/zone.dart:1804:10)
    #4      runZoned (dart:async/zone.dart:1747:10)
    #5      Declarer.declare (package:test_api/src/backend/declarer.dart:169:7)
    #6      RemoteListener.start.<anonymous closure>.<anonymous closure> (package:test_api/src/backend/remote_listener.dart:120:24)
    <asynchronous suspension>''';

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

      test('Format data', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              level: level,
              timestamp: timestamp,
              data: data,
            ),
          ),
          printedData,
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
          '\n${StackTrace.empty}',
        );
      });

      test('Format stacktrace', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              stacktrace: StackTrace.fromString(mockStacktrace),
              level: level,
              timestamp: timestamp,
            ),
          ),
          '\n$formattedStacktrace',
        );
      });

      test('Format message & error', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              message: message,
              error: error,
              stacktrace: StackTrace.fromString(mockStacktrace),
              level: level,
              timestamp: timestamp,
            ),
          ),
          '$message\n$tab$error\n$formattedStacktrace',
        );
      });

      test('Format message & stacktrace', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              message: message,
              stacktrace: StackTrace.fromString(mockStacktrace),
              level: level,
              timestamp: timestamp,
            ),
          ),
          '$message\n$formattedStacktrace',
        );
      });

      test('Format message & data', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              message: message,
              level: level,
              timestamp: timestamp,
              data: data,
            ),
          ),
          '$message$printedData',
        );
      });

      test('Format message, stacktrace & data', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              message: message,
              stacktrace: StackTrace.fromString(mockStacktrace),
              level: level,
              timestamp: timestamp,
              data: data,
            ),
          ),
          '$message\n$formattedStacktrace$printedData',
        );
      });

      test('Format message, error, stacktrace & data', () {
        expect(
          formatter.format(
            defaultTheme,
            LogEntry(
              message: message,
              error: error,
              stacktrace: StackTrace.fromString(mockStacktrace),
              level: level,
              timestamp: timestamp,
              data: data,
            ),
          ),
          '$message\n$tab$error\n$formattedStacktrace$printedData',
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
