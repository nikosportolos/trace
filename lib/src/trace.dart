import 'package:trace/src/core/core.dart';
import 'package:trace/src/manager.dart';

abstract class Trace {
  static final LoggerManager _manager = LoggerManager();

  static LogLevel get level => _manager.level;
  static set level(LogLevel value) => _manager.level = value;
  static void setVerbose() => level = LogLevel.verbose;

  /// Register a new logger
  static void registerLogger(final Logger logger) {
    _manager.registerLogger(logger);
  }

  /// Unregister an existing logger
  static void unregisterLogger(final Logger logger) {
    _manager.unregisterLogger(logger);
  }

  /// Verbose logging
  static void verbose(final Object? message) {
    _manager.verbose(message);
  }

  /// Log debugging messages
  static void debug(final Object? message) {
    _manager.debug(message);
  }

  /// Log info messages
  static void info(final Object? message) {
    _manager.info(message);
  }

  /// Log warnings
  static void warning(final Object? message) {
    _manager.warning(message);
  }

  /// Log errors
  static void error(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) {
    _manager.error(message, error, stackTrace);
  }

  /// Log fatal errors
  static void fatal(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) {
    _manager.fatal(message, error, stackTrace);
  }

  /// Dispose all registered loggers
  static Future<void> dispose() async {
    await _manager.dispose();
  }
}
