import 'package:ansix/ansix.dart';
import 'package:trace/trace.dart';

void main() async {
  final ConsoleLogger logger = ConsoleLogger(
    filter: DefaultLogFilter(
      LogLevel.verbose,
      debugOnly: false,
    ),
    theme: LoggerTheme(
      sections: <LogSection>[
        LogSection.timestamp,
        LogSection.level,
        LogSection.message,
      ],
      timestampFormat: r'Y/m/d H:i:s.vu',
      colorMap: LoggerTheme.defaultColorMap,
      stacktraceIndent: 4,
      timestampTheme: const AnsiTextTheme(
        fixedWidth: 30,
      ),
      levelTheme: const AnsiTextTheme(
        style: AnsiTextStyle(bold: true),
        fixedWidth: 12,
      ),
    ),
  );

  Trace.registerLogger(logger);
  Trace.level = LogLevel.verbose;

  Trace.verbose('This is a verbose test message');
  Trace.debug('This is a debug test message');
  Trace.info('This is an info test message');
  Trace.success('This is a success test message');
  Trace.warning('This is a warning test message');
  Trace.error(
    'This is an error test message',
    error: Exception('Random exception'),
    stackTrace: StackTrace.current,
  );
  Trace.fatal(
    'This is a fatal test message',
    error: Exception('Critical exception'),
    stackTrace: StackTrace.current,
  );

  await Trace.dispose();
}
