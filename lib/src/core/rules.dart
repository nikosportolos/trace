import 'package:trace/src/core/core.dart';

/// Rules interface for filtering log messages
abstract class FilterRule {
  const FilterRule();

  /// Returns true if the filter rule is satisfied
  bool canLog(final LogEntry entry);

  factory FilterRule.debug() => const DebugFilterRule();
  factory FilterRule.level(final LogLevel level) => LevelFilterRule(level);
  factory FilterRule.error(final Type type) => ErrorTypeFilterRule(type);
}

/// Filter log messages for debug mode
class DebugFilterRule extends FilterRule {
  const DebugFilterRule();

  @override
  bool canLog(final LogEntry entry) {
    return isDebugMode;
  }
}

/// Filter log messages by level
class LevelFilterRule extends FilterRule {
  const LevelFilterRule(this.level);
  final LogLevel level;

  @override
  bool canLog(final LogEntry entry) {
    if (level == LogLevel.none) {
      return false;
    }
    return level.index <= entry.level.index;
  }
}

/// Filter log messages by error type
class ErrorTypeFilterRule extends FilterRule {
  const ErrorTypeFilterRule(this.type);
  final Type type;

  @override
  bool canLog(final LogEntry entry) {
    return entry.error.runtimeType == type;
  }
}
