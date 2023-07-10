import 'package:trace/src/core/level.dart';
import 'package:trace/src/filter/filter.dart';
import 'package:trace/src/filter/rules/rules.dart';

/// **DefaultLogFilter**
///
/// This is the default filter for all loggers.
class DefaultLogFilter extends LogFilter {
  DefaultLogFilter(
    this.level, {
    final bool debugOnly = true,
  }) : super(
          rules: <FilterRule>[
            if (debugOnly) const DebugFilterRule(),
            LevelFilterRule(level),
          ],
        );

  final LogLevel level;
}
