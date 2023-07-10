import 'package:ansix/ansix.dart';
import 'package:trace/src/formatter/theme.dart';
import 'package:trace/trace.dart';

void main() async {
  final FormatTheme theme = FormatTheme.create(
    foregroundColor: AnsiColor.white,
    timestampTheme: const AnsiTextTheme(
      fixedWidth: 30,
      style: AnsiTextStyle(italic: true),
      // foregroundColor: AnsiColor.dodgerBlue1,
    ),
    levelTheme: const AnsiTextTheme(
      fixedWidth: 10,
      style: AnsiTextStyle(bold: true),
      // foregroundColor: AnsiColor.darkCyan,
    ),
    messageTheme: const AnsiTextTheme(
      fixedWidth: 35,
      // foregroundColor: AnsiColor.blue,
    ),
    errorTheme: const AnsiTextTheme(
      fixedWidth: 30,
      foregroundColor: AnsiColor.red,
    ),
    stacktraceTheme: const AnsiTextTheme(
      fixedWidth: 50,
      foregroundColor: AnsiColor.darkRed2,
    ),
  );

  final Map<LogLevel, FormatTheme> levelMap = <LogLevel, FormatTheme>{
    LogLevel.verbose: theme,
    LogLevel.debug: theme,
    LogLevel.info: theme,
    LogLevel.warning: theme,
    LogLevel.error: theme,
    LogLevel.fatal: theme,
  };

  final ConsoleLogger logger = ConsoleLogger(
    formatter: LogEntryFormatter(<LogSectionFormatter>[
      LogSectionFormatter.timestamp(levelMap),
      LogSectionFormatter.level(levelMap),
      LogSectionFormatter.message(levelMap),
      LogSectionFormatter.error(levelMap),
      LogSectionFormatter.stacktrace(levelMap),
    ]),
  );

  Trace.registerLogger(logger);
  Trace.level = LogLevel.verbose;

  Trace.verbose('This is a verbose test message');
  Trace.debug('This is a debug test message');
  Trace.info('This is an info test message');
  Trace.warning('This is a warning test message');
  Trace.error(
    'This is an error test message',
    Exception('Random exception'),
    StackTrace.current,
  );
  Trace.fatal(
    'This is a fatal test message',
    Exception('Critical exception'),
    StackTrace.current,
  );

  await Trace.dispose();
}
