import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/rules/rules.dart';

void main() {
  group('Rules', () {
    group('DebugFilterRule', () {});

    group('LevelFilterRule', () {
      for (final LogLevel level in LogLevel.values) {
        test(level.name, () {
          final LevelFilterRule rule = LevelFilterRule(level);
          for (final LogLevel entryLevel in LogLevel.values) {
            final bool shouldLog = level != LogLevel.none && level <= entryLevel;
            expect(rule.canLog(LogEntry(level: entryLevel)), shouldLog);
          }
        });
      }
    });

    group('ErrorTypeFilterRule', () {});
  });
}
