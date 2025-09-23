import 'package:trace/src/formatter/theme/theme.dart';
import 'package:trace/src/logger/io/io.dart';

/// **ConsoleLogger**
///
/// A [Logger] that prints messages on the attached terminal.
class ConsoleLogger extends IoLogger {
  ConsoleLogger({
    super.ioSink,
    super.filter,
    super.level,
    super.allowAnsi,
    final LoggerTheme? theme,
  }) : super(
         theme: theme ?? LoggerTheme(colorMap: LoggerTheme.defaultColorMap),
       );
}
