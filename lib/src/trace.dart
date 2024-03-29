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

  static Map<int, ListItemTheme> listItemThemeMap = ListItemTheme.$defaultTheme;

  static void toggleAnsiFormatting(final bool enabled) {
    _manager.toggleAnsiFormatting(enabled);
  }

  /// Register a new logger
  static void registerLogger(final Logger logger) =>
      _manager.registerLogger(logger);

  /// Register a list of loggers
  static void registerLoggers(final List<Logger> loggers) =>
      loggers.forEach(_manager.registerLogger);

  /// Unregister an existing logger
  static void unregisterLogger(final Logger logger) =>
      _manager.unregisterLogger(logger);

  /// Unregister a list of loggers
  static void unregisterLoggers(final List<Logger> loggers) =>
      loggers.forEach(_manager.unregisterLogger);

  /// Log a message with no filters nor formatting
  ///
  /// **Use with caution on production.**
  static void print(final Object? message) => _manager.print(message);

  /// Log a verbose message
  static void verbose(
    final Object? message, {
    final Object? error,
    final StackTrace? stackTrace,
    Map<String, dynamic> data = const <String, dynamic>{},
  }) {
    _manager.verbose(
      message,
      error: error,
      stackTrace: stackTrace,
      data: data,
    );
  }

  /// Log a debugging message
  static void debug(
    final Object? message, {
    final Object? error,
    final StackTrace? stackTrace,
    Map<String, dynamic> data = const <String, dynamic>{},
  }) {
    _manager.debug(
      message,
      error: error,
      stackTrace: stackTrace,
      data: data,
    );
  }

  /// Log an info message
  static void info(
    final Object? message, {
    final Object? error,
    final StackTrace? stackTrace,
    Map<String, dynamic> data = const <String, dynamic>{},
  }) {
    _manager.info(
      message,
      error: error,
      stackTrace: stackTrace,
      data: data,
    );
  }

  /// Log a success message
  static void success(
    final Object? message, {
    final Object? error,
    final StackTrace? stackTrace,
    Map<String, dynamic> data = const <String, dynamic>{},
  }) {
    _manager.success(
      message,
      error: error,
      stackTrace: stackTrace,
      data: data,
    );
  }

  /// Log warning message
  static void warning(
    final Object? message, {
    final Object? error,
    final StackTrace? stackTrace,
    Map<String, dynamic> data = const <String, dynamic>{},
  }) {
    _manager.warning(
      message,
      error: error,
      stackTrace: stackTrace,
      data: data,
    );
  }

  /// Log an error message
  static void error(
    final Object? message, {
    final Object? error,
    final StackTrace? stackTrace,
    Map<String, dynamic> data = const <String, dynamic>{},
  }) {
    _manager.error(
      message,
      error: error,
      stackTrace: stackTrace,
      data: data,
    );
  }

  /// Log a fatal error messages
  static void fatal(
    final Object? message, {
    final Object? error,
    final StackTrace? stackTrace,
    Map<String, dynamic> data = const <String, dynamic>{},
  }) {
    _manager.fatal(
      message,
      error: error,
      stackTrace: stackTrace,
      data: data,
    );
  }

  static void printListItem(
    final Object? message, {
    final int level = 0,
    final LogLevel logLevel = LogLevel.info,
    final Map<int, ListItemTheme>? map,
  }) {
    _manager.printListItem(
      message,
      level: level,
      logLevel: logLevel,
      map: map ?? listItemThemeMap,
    );
  }

  /// Dispose all registered loggers
  static Future<void> dispose() async => await _manager.dispose();
}
