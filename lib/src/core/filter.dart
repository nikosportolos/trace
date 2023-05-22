import 'package:trace/src/core/core.dart';

typedef LevelCallback = LogLevel Function();

/// **LogFilter**
///
/// Define a set of rules based on which it will be decided
/// if the logger should print the message.
abstract class LogFilter {
  const LogFilter({
    required this.levelCallback,
    this.rules = const <FilterRule>[],
  });

  final LevelCallback levelCallback;
  final List<FilterRule> rules;

  bool canLog(final LogEntry entry) {
    for (final FilterRule rule in rules) {
      if (!rule.canLog(entry)) {
        return false;
      }
    }
    return true;
  }
}

/// **SilentLogFilter**
///
/// This filter mutes all log messages.
class SilentLogFilter extends LogFilter {
  const SilentLogFilter({
    required super.levelCallback,
  });

  @override
  bool canLog(final LogEntry entry) => false;
}

/// **DefaultLogFilter**
///
/// This is the default filter for all loggers.
class DefaultLogFilter extends LogFilter {
  DefaultLogFilter({
    required super.levelCallback,
    final bool debugOnly = true,
  }) : super(
          rules: <FilterRule>[
            if (debugOnly) const DebugFilterRule(),
            LevelFilterRule(levelCallback()),
          ],
        );
}
