import 'dart:io' if (dart.library.html) 'dart:html';

import 'package:mocktail/mocktail.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filters.dart';

class MockException implements Exception {}

class MockIoSink extends Mock implements IOSink {
  @override
  Future<dynamic> flush() async {}

  @override
  Future<dynamic> close() async {}
}

class MockLogFilter extends Mock implements LogFilter {
  @override
  bool canLog(final LogEntry entry) {
    return true;
  }
}

class MockLogEntry extends Mock implements LogEntry {
  MockLogEntry({
    this.message,
    required this.level,
  });

  @override
  final LogLevel level;
  @override
  final Object? message;
}
