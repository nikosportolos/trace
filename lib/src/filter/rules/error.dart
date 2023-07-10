import 'package:trace/src/core/entry.dart';
import 'package:trace/src/filter/rules/rule.dart';

/// **ErrorTypeFilterRule**
///
/// Filter log messages by error type.
class ErrorTypeFilterRule extends FilterRule {
  const ErrorTypeFilterRule(this.type);
  final Type type;

  @override
  bool canLog(final LogEntry entry) {
    return entry.error.runtimeType == type;
  }
}
