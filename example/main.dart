import 'package:trace/trace.dart';

void main() async {
  final ConsoleLogger logger = ConsoleLogger(
    filter: DefaultLogFilter(
      LogLevel.verbose,
      debugOnly: false,
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
