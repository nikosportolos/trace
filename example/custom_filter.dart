import 'package:trace/src/core/core.dart';
import 'package:trace/src/filter/filters.dart';
import 'package:trace/src/logger/loggers.dart';
import 'package:trace/src/trace.dart';

enum Environment { dev, prod }

void main() async {
  Trace.registerLogger(
    ConsoleLogger(
      filter: CustomLogFilter(
        environment: Environment.dev,
        level: LogLevel.error,
      ),
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

class CustomLogFilter extends LogFilter {
  CustomLogFilter({
    required final Environment environment,
    required final LogLevel level,
  }) : super(rules: <FilterRule>[
          const DebugFilterRule(),
          CustomLogRule(environment),
          LevelFilterRule(level),
        ]);
}

class CustomLogRule extends FilterRule {
  const CustomLogRule(this.environment);

  final Environment environment;

  @override
  bool canLog(LogEntry entry) => environment == Environment.dev;
}
