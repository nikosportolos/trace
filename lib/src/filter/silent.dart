import 'package:trace/src/core/entry.dart';
import 'package:trace/src/filter/filter.dart';

/// **SilentLogFilter**
///
/// This filter mutes all log messages.
class SilentLogFilter extends LogFilter {
  SilentLogFilter();

  @override
  bool canLog(final LogEntry entry) => false;
}
