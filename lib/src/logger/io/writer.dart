import 'dart:io';

import 'package:ansix/ansix.dart';

/// IO sink writer.
///
/// Used for writing text to IO sink.
abstract interface class SinkWriter {
  SinkWriter(final IOSink? sink)
    : _sink = sink ?? stdout,
      _shouldCloseSink = sink != null;

  final IOSink _sink;
  final bool _shouldCloseSink;

  factory SinkWriter.create(final IOSink? sink, final bool allowAnsi) {
    return allowAnsi ? AnsiWriter._(sink) : StandardWriter._(sink);
  }

  void write(final Object? object) {
    _sink.write(object);
  }

  void writeln(final Object? object) {
    _sink.writeln(object);
  }

  Future<void> dispose() async {
    await _sink.flush();
    if (_shouldCloseSink) {
      // Avoid closing stdout
      await _sink.close();
    }
  }
}

/// ANSI IO sink writer.
///
/// Used for writing text to IO sink with ANSI formatting.
class AnsiWriter extends SinkWriter {
  AnsiWriter._(super.sink);
}

/// Standard IO sink writer.
///
/// Used for writing plain text IO sink with no formatting.
class StandardWriter extends SinkWriter {
  StandardWriter._(super.sink);

  @override
  void write(final Object? object) {
    super.write(object?.toString().unformatted);
  }

  @override
  void writeln(final Object? object) {
    super.writeln(object?.toString().unformatted);
  }
}
