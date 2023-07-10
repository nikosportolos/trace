import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/rules/rule.dart';

typedef LevelCallback = LogLevel Function();

/// **LogFilter**
///
/// Define a set of rules based on which it will be decided
/// if the logger should print the message.
abstract class LogFilter {
  LogFilter({this.rules});

  final List<FilterRule>? rules;

  bool canLog(final LogEntry entry) {
    for (final FilterRule rule in (rules ?? <FilterRule>[])) {
      if (!rule.canLog(entry)) {
        return false;
      }
    }

    return true;
  }
}
