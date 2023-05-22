import 'package:ansix/ansix.dart';
import 'package:meta/meta.dart';
import 'package:trace/src/core/core.dart';

class LoggerManager {
  LoggerManager() {
    try {
      AnsiX.ensureSupportsAnsi();
    } on AnsiNotSupported catch (e) {
      warning(e.message);
    }
  }

  final List<Logger> _loggers = <Logger>[];
  LogLevel _level = LogLevel.none;
  LogLevel get level => _level;
  set level(LogLevel value) {
    for (final Logger logger in _loggers) {
      logger.level = value;
    }
    _level = value;
  }

  /// Register a new logger
  void registerLogger(final Logger logger) {
    if (!_loggers.contains(logger)) {
      _loggers.add(logger);
    }
  }

  /// Unregister an existing logger
  void unregisterLogger(final Logger logger) {
    if (_loggers.contains(logger)) {
      logger.dispose();
      _loggers.remove(logger);
    }
  }

  /// Verbose logging
  void verbose(final Object? message) {
    log(LogEntry(
      message: message,
      error: null,
      stacktrace: null,
      level: LogLevel.verbose,
    ));
  }

  /// Log debugging messages
  void debug(final Object? message) {
    log(LogEntry(
      message: message,
      error: null,
      stacktrace: null,
      level: LogLevel.debug,
    ));
  }

  /// Log info messages
  void info(final Object? message) {
    log(LogEntry(
      message: message,
      error: null,
      stacktrace: null,
      level: LogLevel.info,
    ));
  }

  /// Log warning messages
  void warning(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) {
    log(LogEntry(
      message: message,
      error: error,
      stacktrace: stackTrace,
      level: LogLevel.warning,
    ));
  }

  /// Log error messages
  void error(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) {
    log(LogEntry(
      message: message,
      error: error,
      stacktrace: stackTrace,
      level: LogLevel.error,
    ));
  }

  /// Log fatal error messages
  void fatal(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) {
    log(LogEntry(
      message: message,
      error: error,
      stacktrace: stackTrace,
      level: LogLevel.fatal,
    ));
  }

  /// Log a [LogEntry] using all registered loggers
  @visibleForTesting
  void log(final LogEntry entry) {
    if (entry.level.index >= level.index) {
      final List<String> s = entry.message.toString().split(AnsiEscapeCodes.newLine);

      final List<LogEntry> logs = s.map((String e) {
        return LogEntry(
          level: entry.level,
          message: e,
          error: entry.error,
          stacktrace: entry.stacktrace,
        );
      }).toList(growable: false);

      for (final Logger logger in _loggers) {
        for (final LogEntry log in logs) {
          logger.print(log);
        }
      }
    }
  }

  /// Dispose all registered loggers
  Future<void> dispose() async {
    for (final Logger logger in _loggers) {
      await logger.dispose();
    }
  }
}
