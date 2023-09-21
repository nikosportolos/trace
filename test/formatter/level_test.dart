import 'package:ansix/ansix.dart';
import 'package:test/test.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/formatter/formatter.dart';

void main() {
  const LevelFormatter formatter = LevelFormatter();

  group('LevelFormatter', () {
    for (final LogLevel level in LogLevel.values) {
      group(level, () {
        test('Default LoggerTheme', () {
          expect(
            formatter.format(
              LoggerTheme(),
              LogEntry(
                level: level,
                timestamp: DateTime.now(),
              ),
            ),
            level.name.toUpperCase().padRight(10),
          );
        });

        test('Custom LoggerTheme', () {
          expect(
            formatter.format(
              LoggerTheme(
                levelTheme: const AnsiTextTheme(
                  style: AnsiTextStyle(bold: true),
                ),
              ),
              LogEntry(
                level: level,
                timestamp: DateTime.now(),
              ),
            ),
            level.name.toUpperCase().bold(),
          );
        });
      });
    }
  });
}
