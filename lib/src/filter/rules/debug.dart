import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/rules/rule.dart';

/// **DebugFilterRule**
///
/// Filter log messages for debug mode.
class DebugFilterRule extends FilterRule {
  const DebugFilterRule();

  @override
  bool canLog(final LogEntry entry) {
    return isDebugMode;
  }
}
