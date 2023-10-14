import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filters.dart';

void main() {
  const String message = '';
  final DateTime now = DateTime.now();

  final LogEntry noneEntry =
      LogEntry(level: LogLevel.none, timestamp: now, message: message);
  final LogEntry verboseEntry =
      LogEntry(level: LogLevel.verbose, timestamp: now, message: message);
  final LogEntry debugEntry =
      LogEntry(level: LogLevel.debug, timestamp: now, message: message);
  final LogEntry infoEntry =
      LogEntry(level: LogLevel.info, timestamp: now, message: message);
  final LogEntry successEntry =
      LogEntry(level: LogLevel.success, timestamp: now, message: message);
  final LogEntry warningEntry =
      LogEntry(level: LogLevel.warning, timestamp: now, message: message);
  final LogEntry errorEntry =
      LogEntry(level: LogLevel.error, timestamp: now, message: message);
  final LogEntry fatalEntry =
      LogEntry(level: LogLevel.fatal, timestamp: now, message: message);

  group('Filters', () {
    test('DefaultLogFilter', () {
      final LogFilter filter =
          DefaultLogFilter(LogLevel.info, debugOnly: false);

      expect(filter.canLog(noneEntry), false);
      expect(filter.canLog(verboseEntry), false);
      expect(filter.canLog(debugEntry), false);
      expect(filter.canLog(infoEntry), true);
      expect(filter.canLog(successEntry), true);
      expect(filter.canLog(warningEntry), true);
      expect(filter.canLog(errorEntry), true);
      expect(filter.canLog(fatalEntry), true);
    });

    test('SilentLogFilter', () {
      final LogFilter filter = SilentLogFilter();

      expect(filter.canLog(noneEntry), false);
      expect(filter.canLog(verboseEntry), false);
      expect(filter.canLog(debugEntry), false);
      expect(filter.canLog(infoEntry), false);
      expect(filter.canLog(successEntry), false);
      expect(filter.canLog(warningEntry), false);
      expect(filter.canLog(errorEntry), false);
      expect(filter.canLog(fatalEntry), false);
    });
  });
}
