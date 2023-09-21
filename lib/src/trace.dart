import 'dart:async';

import 'package:trace/src/core/core.dart';
import 'package:trace/src/logger/logger.dart';
import 'package:trace/src/manager.dart';

abstract class Trace {
  static final LoggerManager _manager = LoggerManager();

  static LogLevel get level => _manager.level;

  static set level(LogLevel value) => _manager.level = value;

  static void setVerbose() => level = LogLevel.verbose;

  static Stream<LogEntry> get stream => _manager.stream;

  /// Register a new logger
  static void registerLogger(final Logger logger) => _manager.registerLogger(logger);

  /// Unregister an existing logger
  static void unregisterLogger(final Logger logger) => _manager.unregisterLogger(logger);

  /// Verbose logging
  static void verbose(final Object? message) => _manager.verbose(message);

  /// Log debugging messages
  static void debug(final Object? message) => _manager.debug(message);

  /// Log info messages
  static void info(final Object? message) => _manager.info(message);

  /// Log success messages
  static void success(final Object? message) => _manager.success(message);

  /// Log warning messages
  static void warning(final Object? message, [final Object? error, final StackTrace? stackTrace]) =>
      _manager.warning(message, error, stackTrace);

  /// Log error messages
  static void error(final Object? message, [final Object? error, final StackTrace? stackTrace]) =>
      _manager.error(message, error, stackTrace);

  /// Log fatal error messages
  static void fatal(final Object? message, [final Object? error, final StackTrace? stackTrace]) =>
      _manager.fatal(message, error, stackTrace);

  static void printListItem(final Object? message, {final int level = 0, final LogLevel logLevel = LogLevel.info}) =>
      _manager.printListItem(message, level: level, logLevel: logLevel);

  /// Dispose all registered loggers
  static Future<void> dispose() async => await _manager.dispose();
}
