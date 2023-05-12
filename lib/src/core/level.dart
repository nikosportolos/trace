/// **Log Level**
///
/// Log levels are a way of categorizing events that occur during
/// the execution of a program, based on their severity or importance.
enum LogLevel {
  /// **NONE**
  ///
  /// No logs will be displayed when this log level is selected.
  none,

  /// **VERBOSE**
  ///
  /// This log level typically refers to a higher level of detail than
  /// the "DEBUG" log level and is used to provide even more information
  /// for troubleshooting and debugging purposes.
  verbose,

  /// **DEBUG**
  ///
  /// This log level is used to provide detailed debugging information
  /// that is only useful for developers during the development process.
  debug,

  /// **INFO**
  ///
  /// This log level is used to provide general information about the state
  /// of the system or program, such as when it starts or stops.
  info,

  /// **WARNING**
  ///
  /// This log level is used to indicate potential issues or errors
  /// that could cause problems, but are not critical.
  warning,

  /// **ERROR**
  ///
  /// This log level is used to indicate errors that have occurred,
  /// but are not fatal to the system or program.
  error,

  /// **FATAL**
  ///
  /// This log level is used to indicate critical errors that
  /// could cause the system or program to fail or crash.
  fatal,
}
