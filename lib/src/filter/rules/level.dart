import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/rules/rule.dart';

/// **LevelFilterRule**
///
/// Filter log messages by level.
class LevelFilterRule extends FilterRule {
  const LevelFilterRule(this.level);
  final LogLevel level;

  @override
  bool canLog(final LogEntry entry) {
    if (level == LogLevel.none) {
      return false;
    }
    return level <= entry.level;
  }
}
