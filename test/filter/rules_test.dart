import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/rules/rules.dart';

import '../mocks.dart';

void main() {
  group('Rules', () {
    test('DebugFilterRule', () {
      final FilterRule rule = FilterRule.debug();
      expect(
        rule.canLog(LogEntry.create(level: LogLevel.verbose)),
        true,
      );
    });

    group('LevelFilterRule', () {
      for (final LogLevel level in LogLevel.values) {
        test(level.name, () {
          final FilterRule rule = FilterRule.level(level);
          for (final LogLevel entryLevel in LogLevel.values) {
            final bool shouldLog =
                level != LogLevel.none && level <= entryLevel;
            expect(rule.canLog(LogEntry.create(level: entryLevel)), shouldLog);
          }
        });
      }
    });

    test('ErrorTypeFilterRule', () {
      final FilterRule rule = FilterRule.error(MockException);

      expect(
        rule.canLog(
          LogEntry.create(level: LogLevel.error, error: MockException()),
        ),
        true,
      );

      expect(
        rule.canLog(LogEntry.create(level: LogLevel.error, error: Exception())),
        false,
      );
    });
  });
}
