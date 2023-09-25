import 'dart:async';

import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/logger/loggers.dart';
import 'package:trace/src/trace.dart';

typedef OnErrorCallback = void Function(Object error, StackTrace stack);

R? runTraced<R>(
  final R Function() body, {
  final Logger? logger,
  final LogLevel level = LogLevel.verbose,
  final OnErrorCallback? onError,
  final Map<Object?, Object?>? zoneValues,
  final ZoneSpecification? zoneSpecification,
}) {
  try {
    AnsiX.ensureSupportsAnsi(silent: true);

    Trace.level = level;
    Trace.registerLogger(logger ?? ConsoleLogger());

    return runZonedGuarded<R>(
      body,
      onError ?? _onError,
      zoneValues: zoneValues,
      zoneSpecification: zoneSpecification,
    );
  } catch (e, st) {
    // ignore: avoid_print
    print('❌ Trace failed.\n$e\n$st'.red());
    return null;
  } finally {
    Trace.dispose();
  }
}

void _onError(final Object error, final StackTrace stack) {
  Trace.fatal('📢 An unhandled error was traced.', error, stack);
}
