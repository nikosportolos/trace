/// **Log Level**
///
/// Log levels are a way of categorizing events that occur during
/// the execution of a program, based on their severity or importance.
class LogLevel implements Comparable<LogLevel> {
  const LogLevel._(this.name, this.value);

  final String name;
  final int value;

  /// **NONE**
  ///
  /// No logs will be displayed when this log level is selected.
  static const LogLevel none = LogLevel._('none', 0);

  /// **VERBOSE**
  ///
  /// This log level typically refers to a higher level of detail than
  /// the "DEBUG" log level and is used to provide even more information
  /// for troubleshooting and debugging purposes.
  static const LogLevel verbose = LogLevel._('verbose', 1);

  /// **DEBUG**
  ///
  /// This log level is used to provide detailed debugging information
  /// that is only useful for developers during the development process.
  static const LogLevel debug = LogLevel._('debug', 2);

  /// **INFO**
  ///
  /// This log level is used to provide general information about the state
  /// of the system or program, such as when it starts or stops.
  static const LogLevel info = LogLevel._('info', 3);

  /// **WARNING**
  ///
  /// This log level is used to indicate potential issues or errors
  /// that could cause problems, but are not critical.
  static const LogLevel warning = LogLevel._('warning', 4);

  /// **ERROR**
  ///
  /// This log level is used to indicate errors that have occurred,
  /// but are not fatal to the system or program.
  static const LogLevel error = LogLevel._('error', 5);

  /// **FATAL**
  ///
  /// This log level is used to indicate critical errors that
  /// could cause the system or program to fail or crash.
  static const LogLevel fatal = LogLevel._('fatal', 6);

  static const List<LogLevel> values = <LogLevel>[none, verbose, debug, info, warning, error, fatal];

  @override
  bool operator ==(Object other) => other is LogLevel && value == other.value;

  bool operator <(LogLevel other) => value < other.value;

  bool operator <=(LogLevel other) => value <= other.value;

  bool operator >(LogLevel other) => value > other.value;

  bool operator >=(LogLevel other) => value >= other.value;

  @override
  int compareTo(LogLevel other) => value - other.value;

  @override
  int get hashCode => value;

  @override
  String toString() => name;
}
