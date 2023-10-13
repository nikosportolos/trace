import 'package:test/test.dart';
import 'package:trace/src/formatter/formatter.dart';
import 'package:trace/src/logger/loggers.dart';

void main() {
  group('ConsoleLogger', () {
    test('Default ConsoleLogger', () async {
      final IoLogger logger = ConsoleLogger();
      expect(
        logger.theme.sections,
        const <LogSection>[
          LogSection.timestamp,
          LogSection.level,
          LogSection.message,
        ],
      );

      expect(logger.theme.timestampFormat, r'H:i:s.vu');
      expect(logger.theme.colorMap, LoggerTheme.defaultColorMap);
      expect(logger.theme.stacktraceIndent, 4);
    });
  });
}
