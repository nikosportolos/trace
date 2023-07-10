import 'package:trace/src/core/entry.dart';
import 'package:trace/src/core/level.dart';
import 'package:trace/src/filter/rules/rules.dart';

/// **FilterRule**
///
/// Rule interface for filtering log messages.
abstract class FilterRule {
  const FilterRule();

  /// Returns true if the filter rule is satisfied.
  bool canLog(final LogEntry entry);

  /// Returns a new instance of [DebugFilterRule].
  factory FilterRule.debug() => const DebugFilterRule();

  /// Returns a new instance of [LevelFilterRule].
  factory FilterRule.level(final LogLevel level) => LevelFilterRule(level);

  /// Returns a new instance of [ErrorTypeFilterRule].
  factory FilterRule.error(final Type type) => ErrorTypeFilterRule(type);
}
