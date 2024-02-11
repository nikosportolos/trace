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
  Trace.debug(
    'This is a debug test message',
    data: <String, dynamic>{
      'user_id': 123,
      'email': 'tester@test.com',
      'is_admin': true,
    },
  );
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
