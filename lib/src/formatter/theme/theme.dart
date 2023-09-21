import 'package:ansix/ansix.dart';
import 'package:trace/src/core/core.dart';
import 'package:trace/src/formatter/section/section.dart';
import 'package:trace/src/formatter/theme/section.dart';

export 'section.dart';

class LoggerTheme {
  LoggerTheme({
    this.colorMap = const <LogLevel, AnsiColor>{},
    this.timestampFormat = r'H:i:s.vu',
    this.stacktraceIndent = 4,
    this.sections = const <LogSection>[
      LogSection.timestamp,
      LogSection.level,
      LogSection.message,
    ],
    final AnsiTextTheme? timestampTheme,
    final LogSectionFormatter? timestampFormatter,
    final AnsiTextTheme? levelTheme,
    final LogSectionFormatter? levelFormatter,
    final AnsiTextTheme? messageTheme,
    final LogSectionFormatter? messageFormatter,
  }) {
    for (final LogSection section in sections) {
      switch (section) {
        case LogSection.level:
          _sectionThemeMap.addAll(<LogSection, LogSectionTheme>{
            section: LogSectionTheme(
              textTheme: levelTheme ?? const AnsiTextTheme(fixedWidth: 10),
              formatter: levelFormatter ?? const LevelFormatter(),
            ),
          });
          break;

        case LogSection.timestamp:
          _sectionThemeMap.addAll(<LogSection, LogSectionTheme>{
            section: LogSectionTheme(
              textTheme: timestampTheme ?? const AnsiTextTheme(fixedWidth: 18),
              formatter: timestampFormatter ?? const TimestampFormatter(),
            ),
          });
          break;

        case LogSection.message:
          _sectionThemeMap.addAll(<LogSection, LogSectionTheme>{
            section: LogSectionTheme(
              textTheme: messageTheme ?? const AnsiTextTheme(),
              formatter: messageFormatter ?? const MessageFormatter(),
            ),
          });
          break;
      }
    }
  }

  final Map<LogLevel, AnsiColor> colorMap;

  /// Defines the order of the log entry sections.
  final List<LogSection> sections;
  final String timestampFormat;

  final int stacktraceIndent;

  Map<LogSection, LogSectionTheme> get sectionThemeMap => _sectionThemeMap;

  final Map<LogSection, LogSectionTheme> _sectionThemeMap = <LogSection, LogSectionTheme>{};

  static final Map<LogLevel, AnsiColor> defaultColorMap = <LogLevel, AnsiColor>{
    LogLevel.none: AnsiColor.none,
    LogLevel.verbose: AnsiColor.grey74,
    LogLevel.debug: AnsiColor.skyBlue3,
    LogLevel.info: AnsiColor.dodgerBlue1,
    LogLevel.success: AnsiColor.green2,
    LogLevel.warning: AnsiColor.orange3,
    LogLevel.error: AnsiColor.red,
    LogLevel.fatal: AnsiColor.red2,
  };

  static final Map<LogLevel, AnsiColor> noColorMap = <LogLevel, AnsiColor>{
    LogLevel.none: AnsiColor.none,
    LogLevel.verbose: AnsiColor.none,
    LogLevel.debug: AnsiColor.none,
    LogLevel.info: AnsiColor.none,
    LogLevel.success: AnsiColor.none,
    LogLevel.warning: AnsiColor.none,
    LogLevel.error: AnsiColor.none,
    LogLevel.fatal: AnsiColor.none,
  };
}
