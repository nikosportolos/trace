import 'package:trace/src/core/core.dart';
import 'package:trace/src/loggers/console.dart';
import 'package:trace/src/trace.dart';

void main() async {
  Trace.registerLogger(
    ConsoleLogger(
      filter: MyLogFilter(),
    ),
  );

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

class MyLogFilter extends LogFilter {
  MyLogFilter({
    super.rules = const <FilterRule>[],
  }) : super(levelCallback: () => LogLevel.warning) {
    rules.add(LevelFilterRule(levelCallback()));
  }
}
