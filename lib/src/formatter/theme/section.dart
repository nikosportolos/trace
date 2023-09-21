import 'package:ansix/ansix.dart';
import 'package:data_class_plugin/data_class_plugin.dart';
import 'package:trace/src/formatter/formatter.dart';

part 'section.gen.dart';

enum LogSection { level, timestamp, message }

@DataClass()
abstract class LogSectionTheme {
  const LogSectionTheme.ctor();

  /// Default constructor
  const factory LogSectionTheme({
    required AnsiTextTheme textTheme,
    required LogSectionFormatter formatter,
  }) = _$LogSectionThemeImpl;

  AnsiTextTheme get textTheme;

  LogSectionFormatter get formatter;
}
