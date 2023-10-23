import 'dart:async';

import 'package:ansix/ansix.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/logger/logger.dart';
import 'package:trace/src/progress/progress_indicator.dart';

class LoggerManager {
  LoggerManager() {
    try {
      AnsiX.ensureSupportsAnsi(
        allowPrint: true,
        colorFormat: ColorFormat.rgb,
      );
    } on AnsiNotSupported catch (e) {
      warning(e.message);
    }
  }

  final PublishSubject<LogEntry> _logController = PublishSubject<LogEntry>();

  Stream<LogEntry> get stream => _logController.stream;

  final List<Logger> _loggers = <Logger>[];
  LogLevel _level = LogLevel.none;

  LogLevel get level => _level;

  set level(LogLevel value) {
    for (final Logger logger in _loggers) {
      logger.level = value;
    }
    _level = value;
  }

  void toggleAnsiFormatting(final bool enabled) {
    if (enabled && !AnsiX.isEnabled) {
      AnsiX.enable();
      return;
    }

    if (!enabled && AnsiX.isEnabled) {
      AnsiX.disable();
    }
  }

  /// Register a new [Logger]
  void registerLogger(final Logger logger) {
    if (!_loggers.contains(logger)) {
      _loggers.add(logger);
    }
  }

  /// Register a list of [Logger]
  void registerLoggers(final List<Logger> loggers) {
    for (final Logger logger in loggers) {
      registerLogger(logger);
    }
  }

  /// Unregister an existing [Logger]
  void unregisterLogger(final Logger logger) {
    if (_loggers.contains(logger)) {
      logger.dispose();
      _loggers.remove(logger);
    }
  }

  /// Standard logging
  ///
  /// No filters nor formatting is applied.
  void print(final Object? message) {
    for (final Logger logger in _loggers) {
      logger.writeln(message);
    }
  }

  /// Verbose logging
  void verbose(final Object? message) {
    log(LogEntry.create(
      message: message,
      error: null,
      stacktrace: null,
      level: LogLevel.verbose,
    ));
  }

  /// Log debugging messages
  void debug(final Object? message) {
    log(LogEntry.create(
      message: message,
      error: null,
      stacktrace: null,
      level: LogLevel.debug,
    ));
  }

  /// Log info messages
  void info(final Object? message) {
    log(LogEntry.create(
      message: message,
      error: null,
      stacktrace: null,
      level: LogLevel.info,
    ));
  }

  /// Log success messages
  void success(final Object? message) {
    log(LogEntry.create(
      message: message,
      error: null,
      stacktrace: null,
      level: LogLevel.success,
    ));
  }

  /// Log warning messages
  void warning(
    final Object? message, [
    final Object? error,
    final StackTrace? stackTrace,
  ]) {
    log(LogEntry.create(
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
    log(LogEntry.create(
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
    log(LogEntry.create(
      message: message,
      error: error,
      stacktrace: stackTrace,
      level: LogLevel.fatal,
    ));
  }

  /// Log a [LogEntry] using all registered loggers
  @visibleForTesting
  void log(final LogEntry entry) {
    if (entry.level >= level) {
      final List<String> s =
          entry.message.toString().split(AnsiEscapeCodes.newLine);

      final List<LogEntry> logs = s.map((String e) {
        return LogEntry.create(
          level: entry.level,
          message: e,
          error: entry.error,
          stacktrace: entry.stacktrace,
        );
      }).toList(growable: false);

      for (final Logger logger in _loggers) {
        for (final LogEntry log in logs) {
          logger.log(log);
        }
      }

      _logController.add(entry);
    }
  }

  void printListItem(
    final Object? message, {
    final int level = 0,
    final LogLevel logLevel = LogLevel.info,
    final Map<int, ListItemTheme> map = ListItemTheme.$defaultTheme,
  }) {
    final String tabs = '  ' * level;
    final String indicator = map[level]?.symbol ?? '-';
    final AnsiColor color = map[level]?.foregroundColor ?? AnsiColor.none;

    log(
      LogEntry(
        level: logLevel,
        timestamp: DateTime.now(),
        message: '$tabs${indicator.colored(foreground: color)} $message',
      ),
    );
  }

  void startProgress(final ProgressIndicator progress) {
    for (final Logger logger in _loggers) {
      logger.startProgress(progress);
    }
  }

  void stopProgress() {
    for (final Logger logger in _loggers) {
      logger.stopProgress();
    }
  }

  /// Dispose all registered loggers
  Future<void> dispose() async {
    stopProgress();

    await _logController.close();

    for (final Logger logger in _loggers) {
      await logger.dispose();
    }
  }
}
