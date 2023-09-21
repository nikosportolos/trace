import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';

void main() {
  group('LogLevel', () {
    test('operators', () {
      expect(LogLevel.none > LogLevel.verbose, false);
      expect(LogLevel.none < LogLevel.verbose, true);
      expect(LogLevel.none == LogLevel.none, true);
      expect(LogLevel.none >= LogLevel.verbose, false);
      expect(LogLevel.none <= LogLevel.verbose, true);
    });

    test('compareTo', () {
      expect(LogLevel.verbose.compareTo(LogLevel.debug), -1);
      expect(LogLevel.debug.compareTo(LogLevel.fatal), -5);
    });

    test('hashCode', () {
      for (final LogLevel level in LogLevel.values) {
        expect(level.hashCode, level.value);
      }
    });

    test('toString', () {
      for (final LogLevel level in LogLevel.values) {
        expect(level.toString(), level.name);
      }
    });

    test('toJson', () {
      for (final LogLevel level in LogLevel.values) {
        expect(level.toJson(), level.name);
      }
    });

    test('fromJson', () {
      expect(LogLevel.fromJson(<String, dynamic>{'level': 'none'}), LogLevel.none);
      expect(LogLevel.fromJson(<String, dynamic>{'level': 'verbose'}), LogLevel.verbose);
      expect(LogLevel.fromJson(<String, dynamic>{'level': 'debug'}), LogLevel.debug);
      expect(LogLevel.fromJson(<String, dynamic>{'level': 'info'}), LogLevel.info);
      expect(LogLevel.fromJson(<String, dynamic>{'level': 'success'}), LogLevel.success);
      expect(LogLevel.fromJson(<String, dynamic>{'level': 'warning'}), LogLevel.warning);
      expect(LogLevel.fromJson(<String, dynamic>{'level': 'error'}), LogLevel.error);
      expect(LogLevel.fromJson(<String, dynamic>{'level': 'fatal'}), LogLevel.fatal);
    });
  });
}
