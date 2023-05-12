import 'package:trace/src/core/entry.dart';
import 'package:trace/src/format/format.dart';

class LevelFormatter implements LogFormatter {
  @override
  String format(final LogEntry entry) {
    return entry.level.name;
  }
}

class TimestampFormatter implements LogFormatter {
  @override
  String format(final LogEntry entry) {
    return entry.timestamp.toString();
  }
}

class MessageFormatter implements LogFormatter {
  @override
  String format(final LogEntry entry) {
    if (entry.message == null) {
      return '';
    }
    return entry.message.toString();
  }
}

class ErrorFormatter implements LogFormatter {
  @override
  String format(final LogEntry entry) {
    if (entry.error == null) {
      return '';
    }
    return entry.error.toString();
  }
}

class StacktraceFormatter implements LogFormatter {
  @override
  String format(final LogEntry entry) {
    if (entry.stacktrace == null) {
      return '';
    }
    return entry.stacktrace.toString();
  }
}
