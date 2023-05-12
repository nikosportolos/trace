import 'package:trace/src/core/core.dart';

typedef LevelCallback = LogLevel Function();

abstract class LogFilter {
  const LogFilter({
    required this.levelCallback,
    this.rules = const <FilterRule>[],
  });

  final LevelCallback levelCallback;
  final List<FilterRule> rules;

  bool canLog(final LogEntry entry);
}

class SilentLogFilter extends LogFilter {
  const SilentLogFilter({
    required super.levelCallback,
  });

  @override
  bool canLog(final LogEntry entry) => false;
}

class DefaultLogFilter extends LogFilter {
  DefaultLogFilter({
    required super.levelCallback,
  }) : super(
          rules: <FilterRule>[
            const DebugFilterRule(),
            LevelFilterRule(levelCallback()),
          ],
        );

  @override
  bool canLog(final LogEntry entry) {
    for (final FilterRule rule in rules) {
      if (!rule.canLog(entry)) {
        return false;
      }
    }
    return true;
  }
}
