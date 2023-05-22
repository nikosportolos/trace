import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/loggers/silent.dart';

void main() {
  group('SilentLogger', () {
    test('smoke test', () {
      final SilentLogger logger = SilentLogger();

      expect(logger.formatter.theme, isEmpty);
      expect(logger.level, LogLevel.none);
    });
  });
}
