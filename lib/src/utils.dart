import 'dart:async';

import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/logger/console.dart';
import 'package:trace/src/logger/logger.dart';
import 'package:trace/src/trace.dart';

typedef OnErrorCallback = void Function(Object error, StackTrace stack);

R? runTraced<R>(
  R Function() body, {
  Logger? logger,
  LogLevel level = LogLevel.verbose,
  OnErrorCallback? onError,
  Map<Object?, Object?>? zoneValues,
  ZoneSpecification? zoneSpecification,
}) {
  try {
    AnsiX.ensureSupportsAnsi(silent: true);

    Trace.level = level;
    Trace.registerLogger(logger ?? ConsoleLogger());

    return runZonedGuarded<R>(
      body,
      onError ??
          (Object error, StackTrace stack) {
            Trace.fatal('📢 An unhandled error was traced.', error, stack);
          },
      zoneValues: zoneValues,
      zoneSpecification: zoneSpecification,
    );
  } catch (e, st) {
    // ignore: avoid_print
    print('Trace failed.\n$e\n$st'.red());
    return null;
  } finally {
    Trace.dispose();
  }
}
